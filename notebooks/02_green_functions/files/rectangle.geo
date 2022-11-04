/*
Mesh to evaluate the potential due to a planet
with rectangular shape.

Author: Nicolás Guarín-Zapata
Date: August 2021
*/

length = 1.0;
height = 0.1;
radius = 5.0;
l0 = 0.01;
lc = 1;

// Points
Point(1) = {-length/2, -height/2, 0, l0};
Point(2) = {length/2, -height/2, 0, l0};
Point(3) = {length/2, height/2, 0, l0};
Point(4) = {-length/2, height/2, 0, l0};
Point(5) = {-radius * Cos(Pi/4), -radius * Cos(Pi/4), 0, lc};
Point(6) = {radius * Cos(Pi/4), -radius * Cos(Pi/4), 0, lc};
Point(7) = {radius * Cos(Pi/4), radius * Cos(Pi/4), 0, lc};
Point(8) = {-radius * Cos(Pi/4), radius * Cos(Pi/4), 0, lc};
Point(9) = {0, 0, 0, l0};

// Lines
Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 1};
Circle(5) = {5, 9, 6};
Circle(6) = {6, 9, 7};
Circle(7) = {7, 9, 8};
Circle(8) = {8, 9, 5};

// Surfaces
Line Loop(1) = {3, 4, 1, 2};
Plane Surface(1) = {1};
Line Loop(2) = {7, 8, 5, 6};
Plane Surface(2) = {1, 2};

// Physical groups
Physical Surface(1) = {1};
Physical Surface(2) = {2};
