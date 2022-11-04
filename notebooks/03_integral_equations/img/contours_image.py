"""
Isocontours for two point loads in 2D.

@author: Nicolás Guarín-Zapata
@date: September 2021
"""
import numpy as np
import matplotlib.pyplot as plt


plt.rcParams["contour.negative_linestyle"] ="dashed"

y, x = np.mgrid[-3:3:201j, -3:3:201j]

q0 = -1
x0 = -1
y0 = -1
r0 = np.sqrt((x - x0)**2 + (y - y0)**2)
pot0 = 0.5*q0/np.pi*np.log(r0)

q1 = 1
x1 = 1
y1 = 1
r1 = np.sqrt((x - x1)**2 + (y - y1)**2)
pot1 = 0.5*q1/np.pi*np.log(r1)

plt.contour(x, y, pot0 + pot1, [-0.4, -0.2, -0.15,  0, 0.15, 0.2, 0.4],
            colors="#3c3c3c")
plt.text(1, 3, "Negative charge")
plt.text(-1, -3, "Positive charge")
plt.text(-4, 0, "Circles of constant potential")
plt.axis("image")
plt.axis("off")
plt.savefig("contours_image.svg")
plt.show()
