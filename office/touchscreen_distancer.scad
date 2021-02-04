$fn = 180;

diameter_outter = 5;
diameter_inner = 3.1;
height = 3.1;

difference() {
    cylinder(d=diameter_outter, height);
    cylinder(d=diameter_inner, height);
}