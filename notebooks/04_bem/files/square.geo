/*
Square domain

Author: Nicolás Guarín-Zapata
Date: September 2021
*/



side = Pi;
size = 1;

// Points
Point(1) = {0, 0, 0, size};
Point(2) = {side, 0, 0, size};
Point(3) = {side, side, 0, size};
Point(4) = {0, side, 0, size};

// Lines
Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 1};


// Surfaces
Curve Loop(1) = {1, 2, 3, 4};
Plane Surface(1) = {1};

// Physical groups
Physical Curve(1) = {1, 2, 3, 4};
Physical Surface(2) = {1};

// Mesh parameters
ndiv = 21;
Transfinite Curve {1, 2, 3, 4} = ndiv Using Progression 1;
Transfinite Surface {1};
