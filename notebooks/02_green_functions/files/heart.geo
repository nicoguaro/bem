/*
Mesh to evaluate the potential due to a planet
with a heart shape.

Author: Nicolas Guarin-Zapata
Date: June 2021
*/

npts = 20;
t0 = 0;
t1 = Pi;
dt = (t1 - t0)/(npts - 1);
r0 = 0.5;
radius = 5.0;
size = 100.0;

// Define points
For cont In {1:npts - 1}
    t = t0 + (cont - 1)*dt;
    Point(cont) = {-r0*Sin(t)^3,
                   r0/13*(13*Cos(t) - 5*Cos(2*t) - 2*Cos(3*t) - Cos(4*t) + 2.5),
                   0, 2.0};
    Point(cont + npts - 1) = {-r0*Sin(t + Pi)^3,
                   r0/13*(13*Cos(t + Pi) - 5*Cos(2*(t + Pi)) - 2*Cos(3*(t + Pi)) - Cos(4*(t + Pi)) + 2.5),
                   0, 2.0};
EndFor

Point(2*npts + 1) = {-radius * Cos(Pi/4), -radius * Cos(Pi/4), 0, size};
Point(2*npts + 2) = {radius * Cos(Pi/4), -radius * Cos(Pi/4), 0, size};
Point(2*npts + 3) = {radius * Cos(Pi/4), radius * Cos(Pi/4), 0, size};
Point(2*npts + 4) = {-radius * Cos(Pi/4), radius * Cos(Pi/4), 0, size};
Point(2*npts + 5) = {0, 0, 0, 10.0};

// Define lines

Spline(1) = List[{1:npts}];
Spline(2) = List[{npts:2*npts - 2, 1}];
Circle(3) = {2*npts + 1, 2*npts + 5, 2*npts + 2};
Circle(4) = {2*npts + 2, 2*npts + 5, 2*npts + 3};
Circle(5) = {2*npts + 3, 2*npts + 5, 2*npts + 4};
Circle(6) = {2*npts + 4, 2*npts + 5, 2*npts + 1};

// Surfaces
Line Loop(1) = {1, 2};
Plane Surface(1) = {1};
Line Loop(2) = {3, 4, 5, 6};
Plane Surface(2) = {2, 1};

// Physical groups
Physical Surface(1) = {1};
Physical Surface(2) = {2};

