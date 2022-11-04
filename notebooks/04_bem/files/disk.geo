// Gmsh project created on Thu Jun 11 12:24:03 2020


rad = 1.0;
size = 1.0;

// Points
Point(1) = {0, 0, 0, size};
Point(2) = {rad, 0, 0, size};
Point(3) = {0, rad, 0, size};
Point(4) = {-rad, 0, 0, size};
Point(5) = {0, -rad, 0, 0, size};

// Lines
Circle(1) = {2, 1, 3};
Circle(2) = {3, 1, 4};
Circle(3) = {4, 1, 5};
Circle(4) = {5, 1, 2};

// Surfaces
Curve Loop(1) = {1, 2, 3, 4};
Plane Surface(1) = {1};

// Physical groups
Physical Curve(1) = {1, 2, 3, 4};
Physical Surface(2) = {1};

// Mesh parameters
ndiv = 321;
Transfinite Curve {1, 2, 3, 4} = ndiv Using Progression 1;
Transfinite Surface {1};
