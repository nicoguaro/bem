/*
Programmatically define a mesh for a region enclosed by a curve
given in parametric for for polar coordinates. This version generates
a structured mesh.

Author: Nicolas Guarin-Zapata
Date: October, 2018
*/

size = 0.05;
npts = 30;
nturns = 8;
t0 = 0;
t1 = Pi/2;
dt = (t1 - t0)/(npts - 1);
r0 = 1;
rs = 0.2;

// Define points
For cont In {1:npts}
    t = t0 + (cont - 1)*dt;
    r = r0 + rs*Cos(nturns*t);
    Point(cont) = {r*Cos(t), r*Sin(t), 0, size};
    Point(cont + npts) = {r*Cos(t + Pi/2), r*Sin(t + Pi/2), 0, size};
    Point(cont + 2*npts) = {r*Cos(t + Pi), r*Sin(t + Pi), 0, size};
    Point(cont + 3*npts) = {r*Cos(t + 3*Pi/2), r*Sin(t + 3*Pi/2), 0, size};
EndFor

Point(4*npts + 1) = {r0/2, 0, 0, size};
Point(4*npts + 2) = {0, r0/2, 0, size};
Point(4*npts + 3) = {-r0/2, 0.0, 0, size};
Point(4*npts + 4) = {0, -r0/2, 0, size};


// Define splines
Spline(1) = List[{1:npts}];
Spline(2) = List[{npts:2*npts}];
Spline(3) = List[{2*npts:3*npts}];
Spline(4) = {List[{3*npts:4*npts - 1}], 1};

Line(5) = {4*npts + 1, 4*npts + 2};
Line(6) = {4*npts + 2, 4*npts + 3};
Line(7) = {4*npts + 3, 4*npts + 4};
Line(8) = {4*npts + 4, 4*npts + 1};

Line(9) = {4*npts + 1, 1};
Line(10) = {4*npts + 2, npts};
Line(11) = {4*npts + 3, 2*npts};
Line(12) = {4*npts + 4, 3*npts};

// Define plane
Line Loop(1) = {1, -10, -5, 9};
Plane Surface(1) = {1};
Line Loop(2) = {10, 2, -11, -6};
Plane Surface(2) = {2};
Line Loop(3) = {11, 3, -12, -7};
Plane Surface(3) = {3};
Line Loop(4) = {4, -9, -8, 12};
Plane Surface(4) = {4};
Line Loop(5) = {5, 6, 7, 8};
Plane Surface(5) = {5};

// Mesh parameters
ndiv_rad = 20;
ndiv_arc = 20;
Transfinite Line {11, 12, 9, 10} = ndiv_rad Using Progression 1;
Transfinite Line {2, 6, 7, 5, 1, 8, 4, 3} = ndiv_arc Using Progression 1;
Transfinite Surface {2};
Transfinite Surface {3};
Transfinite Surface {5};
Transfinite Surface {1};
Transfinite Surface {4};
Recombine Surface {2, 1, 4, 5, 3};
//+
Physical Curve(1) = {2, 3, 4, 1};
//+
Physical Surface(2) = {2, 1, 5, 3, 4};
