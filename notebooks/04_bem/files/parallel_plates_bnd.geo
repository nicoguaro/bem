/*
Geometry for a parallel plates capacitor

Author: Nicolás Guarín-Zapata
Date: July 2021
*/
lc0 = 0.5;
lc = 10.0;
L = 1.0;
h = 0.1;
t = 0.01;
r = 5.0;

// Points
Point(1) = {0, 0, 0, lc0};
Point(2) = {-L/2, h/2, 0, lc0};
Point(3) = {L/2, h/2, 0, lc0};
Point(4) = {L/2, (h + t)/2, 0, lc0};
Point(5) = {L/2, h/2 + t, 0, lc0};
Point(6) = {-L/2, h/2 + t, 0, lc0};
Point(7) = {-L/2, (h + t)/2, 0, lc0};
Point(8) = {-L/2, h/2, 0, lc0};
Point(9) = {-L/2, -h/2, 0, lc0};
Point(10) = {L/2, -h/2, 0, lc0};
Point(11) = {L/2, -(h + t)/2, 0, lc0};
Point(12) = {L/2, -h/2 - t, 0, lc0};
Point(13) = {-L/2, -h/2 - t, 0, lc0};
Point(14) = {-L/2, -(h + t)/2, 0, lc0};
Point(15) = {-L/2, -h/2, 0, lc0};
Point(16) = {r*Cos(Pi/4), r*Sin(Pi/4), 0, lc};
Point(17) = {-r*Cos(Pi/4), r*Sin(Pi/4), 0, lc};
Point(18) = {-r*Cos(Pi/4), -r*Sin(Pi/4), 0, lc};
Point(19) = {r*Cos(Pi/4), -r*Sin(Pi/4), 0, lc};

// Lines
Line(1) = {2, 3};
Circle(2) = {3, 4, 5};
Line(3) = {5, 6};
Circle(4) = {6, 7, 2};
Line(5) = {13, 12};
Circle(6) = {9, 14, 13};
Line(7) = {10, 9};
Circle(8) = {12, 11, 10};

// Physical groups
Physical Curve(1) = {1, 2, 3, 4}; // Top plate
Physical Curve(2) = {5, 6, 7, 8}; // Bottom plate
