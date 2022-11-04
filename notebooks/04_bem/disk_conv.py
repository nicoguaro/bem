#!/usr/bin/env python
# coding: utf-8
"""

"""
import numpy as np
from numpy.linalg import solve
import matplotlib.pyplot as plt
import meshio
from bem import (assem, eval_sol, read_geo_gmsh,
                 rearrange_mats, rearrange_sol,
                 create_rhs, surf_plot)


def u_bc(x_m, y_m):
    theta = np.unwrap(np.arctan2(y_m, x_m))
    return 3*np.cos(6*theta)

def q_bc(x_m, y_m):
    theta = np.unwrap(np.arctan2(y_m, x_m))
    return -18*np.cos(6*theta)


nums = [40, 80, 160, 320, 640, 1280]
nums = [5120]
fnames = ["files/disk_%d.msh" % num for num in nums]
for fname in fnames:
    print("Running for " + fname[6:-4])
    mesh, coords, elems, x_m, y_m, id_dir, id_neu = read_geo_gmsh(fname,
    [0, 1], [2, 3])
    Gmat, Fmat = assem(coords, elems)
    A, B = rearrange_mats(Fmat, Gmat, id_dir, id_neu)
    rhs = create_rhs(x_m, y_m, u_bc, q_bc, id_dir, id_neu)
    sol = solve(A, B.dot(rhs))
    u_bound, q_bound = rearrange_sol(sol, rhs, id_dir, id_neu)
    solution = eval_sol(mesh.points[:, :2], coords, elems, u_bound, q_bound)
    ev_x, ev_y = mesh.points[:, :2].T
    ev_r = np.sqrt(ev_x**2 + ev_y**2)
    ev_theta = np.unwrap(np.arctan2(ev_y, ev_x))
    sol_analytic = 3 * ev_r**6 * np.cos(6*ev_theta)
    mesh.point_data["potential"] = solution
    mesh.write(fname[:-4] + ".vtk")


#%% Visualization of error for last mesh
plt.figure()
ax = surf_plot(mesh, 4, solution - sol_analytic)
ax.set_zlim(-3, 3)
ax.set_xticks([])
ax.set_yticks([])
ax.set_zticks([])
plt.show()
