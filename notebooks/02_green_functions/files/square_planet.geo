/*
Mesh to evaluate the potential due to a planet
with square shape.

Author: Nicolás Guarín-Zapata
Date: June 2021
*/

length = 1.0;
radius = 5.0;
lc = 100;

// Points
Point(1) = {-length/2, -length/2, 0, 1.0};
Point(2) = {length/2, -length/2, 0, 1.0};
Point(3) = {length/2, length/2, 0, 1.0};
Point(4) = {-length/2, length/2, 0, 1.0};
Point(5) = {-radius * Cos(Pi/4), -radius * Cos(Pi/4), 0, lc};
Point(6) = {radius * Cos(Pi/4), -radius * Cos(Pi/4), 0, lc};
Point(7) = {radius * Cos(Pi/4), radius * Cos(Pi/4), 0, lc};
Point(8) = {-radius * Cos(Pi/4), radius * Cos(Pi/4), 0, lc};
Point(9) = {0, 0, 0, 1.0};

// Lines
Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 1};
Line(5) = {1, 5};
Line(6) = {2, 6};
Line(7) = {3, 7};
Line(8) = {4, 8};
Circle(9) = {5, 9, 6};
Circle(10) = {6, 9, 7};
Circle(11) = {7, 9, 8};
Circle(12) = {8, 9, 5};

// Surfaces
Curve Loop(1) = {3, 4, 1, 2};
Plane Surface(1) = {1};
Curve Loop(2) = {5, 9, -6, -1};
Plane Surface(2) = {2};
Curve Loop(3) = {6, 10, -7, -2};
Plane Surface(3) = {3};
Curve Loop(4) = {7, 11, -8, -3};
Plane Surface(4) = {4};
Curve Loop(5) = {12, -5, -4, 8};
Plane Surface(5) = {5};

// Physical groups
Physical Surface(1) = {1};
Physical Surface(2) = {4, 5, 2, 3};

// Mesh parameters

