$fn = 180;

height = 1;

difference() {
    cylinder(d=50, h=height);
    translate([23, 0, 0]) cylinder(d=2, h=1);
    translate([-23, 0, 0]) cylinder(d=2, h=1);
}