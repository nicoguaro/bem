#!/usr/bin/env python
# coding: utf-8
"""

"""
import numpy as np
from numpy.linalg import solve
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
from bem import (assem, eval_sol, read_geo_gmsh,
                 rearrange_mats, rearrange_sol,
                 surf_plot, create_rhs)



mesh, coords, elems, x_m, y_m, id_dir, id_neu = read_geo_gmsh("files/ring.msh",
[0, 1, 2, 3, 4, 5, 6, 7], None)
Gmat, Fmat = assem(coords, elems)


def u_bc(x_m, y_m):
    r = np.sqrt(x_m**2 + y_m**2)
    # theta = np.unwrap(np.arctan2(y_m, x_m))
    # return 3 * r**6 * np.cos(6*theta)
    return 2*r - 1

def q_bc(x_m, y_m):
    r = np.sqrt(x_m**2 + y_m**2)
    theta = np.unwrap(np.arctan2(y_m, x_m))
    return -18 *r**5 *np.cos(6*theta)*0

u_bound = u_bc(x_m, y_m)
q_bound = solve(Gmat, Fmat @ u_bound)
q_bound = np.ones_like(x_m)
r = np.sqrt(x_m**2 + y_m**2)
q_bound[r < 0.6] = -1
# A, B = rearrange_mats(Fmat, Gmat, id_dir, id_neu)
# rhs = create_rhs(x_m, y_m, u_bc, q_bc, id_dir, id_neu)
# sol = solve(A, B.dot(rhs))

#%%
solution = eval_sol(mesh.points[:, :2], coords, elems, u_bound, q_bound)

mesh.point_data["potential"] = solution
mesh.write("files/ring.vtk")

#%% Visualization
ax = surf_plot(mesh, 8, solution)
ax.set_xticks([])
ax.set_yticks([])
ax.set_zticks([])
plt.show()
