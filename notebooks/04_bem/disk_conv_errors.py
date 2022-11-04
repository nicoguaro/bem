#!/usr/bin/env python
# coding: utf-8
"""

"""
import numpy as np
from numpy.linalg import solve
import matplotlib.pyplot as plt
import meshio

nums = [40, 80, 160, 320, 640, 1280, 2560]
sizes = [2*np.pi/num for num in nums]
errors_L2 = []
errors_oo = []
fnames = ["files/disk_%d.vtk" % num for num in nums]
for fname in fnames:
    mesh = meshio.read(fname)
    solution = mesh.point_data["potential"]
    ev_x, ev_y = mesh.points[:, :2].T
    ev_r = np.sqrt(ev_x**2 + ev_y**2)
    ev_theta = np.unwrap(np.arctan2(ev_y, ev_x))
    sol_analytic = 3 * ev_r**6 * np.cos(6*ev_theta)
    errors_L2.append(np.linalg.norm(solution - sol_analytic)
                     /np.linalg.norm(sol_analytic))
    errors_oo.append(np.linalg.norm(solution - sol_analytic, ord=np.inf)
                     /np.linalg.norm(sol_analytic, ord=np.inf))


from scipy.stats import linregress
slope, intercept, r, p, se = linregress(np.log10(sizes), np.log10(errors_L2))
print(slope)
slope, intercept, r, p, se = linregress(np.log10(sizes), np.log10(errors_oo))
print(slope)


#%% Error visualization
plt.figure()
plt.loglog(sizes, errors_L2, marker="o")
plt.loglog(sizes, errors_oo, marker="s")
plt.xlabel("Size of the element")
plt.ylabel("Relative norm")
plt.legend([r"$L_2$-norm", r"$L_\infty$-norm"])
plt.show()
# %%
