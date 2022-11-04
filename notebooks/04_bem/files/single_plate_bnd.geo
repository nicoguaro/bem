/*
Geometry for a single conductor plate

Author: Nicolás Guarín-Zapata
Date: July 2021
*/
lc0 = 0.5;
lc = 10.0;
L = 1.0;
t = 0.01;
r = 5.0;

// Points
Point(1) = {0, 0, 0, lc0};
Point(2) = {-L/2, -t/2, 0, lc0};
Point(3) = {L/2, -t/2, 0, lc0};
Point(4) = {L/2, 0, 0, lc0};
Point(5) = {L/2, t/2, 0, lc0};
Point(6) = {-L/2, t/2, 0, lc0};
Point(7) = {-L/2, 0, 0, lc0};
Point(8) = {-L/2, t/2, 0, lc0};
Point(16) = {r*Cos(Pi/4), r*Sin(Pi/4), 0, lc};
Point(17) = {-r*Cos(Pi/4), r*Sin(Pi/4), 0, lc};
Point(18) = {-r*Cos(Pi/4), -r*Sin(Pi/4), 0, lc};
Point(19) = {r*Cos(Pi/4), -r*Sin(Pi/4), 0, lc};

// Lines
Line(1) = {2, 3};
Circle(2) = {3, 4, 5};
Line(3) = {5, 6};
Circle(4) = {6, 7, 2};
Circle(5) = {18, 1, 19};
Circle(6) = {19, 1, 16};
Circle(7) = {16, 1, 17};
Circle(8) = {17, 1, 18};

// Surface
Curve Loop(1) = {1, 2, 3, 4};
Curve Loop(2) = {5, 8, 7, 6};
Plane Surface(1) = {2, 1};

// Physical groups
Physical Curve(1) = {1, 2, 3, 4}; // Plate
//Physical Surface(2) = {1}; // Air
