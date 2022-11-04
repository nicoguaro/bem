/*

Author: Nicolás Guarín-Zapata
Date: July 2021
*/


rad = 1.0;
rad_in = 0.5;
size = 1.0;

// Points
Point(1) = {0, 0, 0, size};
Point(2) = {rad, 0, 0, size};
Point(3) = {0, rad, 0, size};
Point(4) = {-rad, 0, 0, size};
Point(5) = {0, -rad, 0, 0, size};
Point(6) = {rad_in, 0, 0, size};
Point(7) = {0, rad_in, 0, size};
Point(8) = {-rad_in, 0, 0, size};
Point(9) = {0, -rad_in, 0, 0, size};

// Lines
Circle(1) = {2, 1, 3};
Circle(2) = {3, 1, 4};
Circle(3) = {4, 1, 5};
Circle(4) = {5, 1, 2};
Circle(5) = {6, 1, 7};
Circle(6) = {7, 1, 8};
Circle(7) = {8, 1, 9};
Circle(8) = {9, 1, 6};

// Surfaces
Curve Loop(1) = {1, 2, 3, 4};
Curve Loop(2) = {5, 6, 7, 8};
Plane Surface(1) = {1, 2};

// Physical groups
Physical Curve(1) = {1, 2, 3, 4, 5, 6, 7, 8};
Physical Surface(2) = {1};

// Mesh parameters
ndiv_in = 21;
Transfinite Curve {5, 6, 7, 8} = ndiv_in Using Progression 1;
ndiv = 2 * ndiv_in;
Transfinite Curve {1, 2, 3, 4} = ndiv Using Progression 1;


/*

// Lines
Circle(1) = {2, 1, 3};
Circle(2) = {3, 1, 4};
Circle(3) = {4, 1, 5};
Circle(4) = {5, 1, 2};
Circle(5) = {6, 1, 7};
Circle(6) = {7, 1, 8};
Circle(7) = {8, 1, 9};
Circle(8) = {9, 1, 6};
Line(9) = {2, 6};
Line(10) = {3, 7};
Line(11) = {4, 8};
Line(12) = {5, 9};


// Surfaces
Curve Loop(1) = {4, 9, -8, -12};
Plane Surface(1) = {1};
Curve Loop(2) = {1, 10, -5, -9};
Plane Surface(2) = {2};
Curve Loop(3) = {10, 6, -11, -2};
Plane Surface(3) = {3};
Curve Loop(4) = {3, 12, -7, -11};
Plane Surface(4) = {4};


// Physical groups
Physical Curve(1) = {1, 2, 3, 4, 5, 6, 7, 8};
Physical Surface(2) = {1, 2, 3, 4};

// Mesh parameters
ndiv = 11;
Transfinite Curve {1, 2, 3, 4, 5, 6, 7, 8} = ndiv Using Progression 1;
Transfinite Surface {1};
Transfinite Surface {2};
Transfinite Surface {3};
Transfinite Surface {4};
*/
