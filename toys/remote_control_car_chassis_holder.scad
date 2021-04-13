$fn = 100;

hole_diameter = 1.8;
hole_length = 5;
length_offset = 10;

rotate([0, 90, 0]) {
    cylinder(d=hole_diameter, hole_length + length_offset);
    difference() {
        rotate([20, 0, 0]) cylinder(d=hole_diameter, hole_length + length_offset);
        translate([-0.9, -1, 8]) rotate([0, 90, 0]) cylinder(d=hole_length, hole_diameter);
    }
    difference() {
        translate([-1, -2, 8]) rotate([0, 90, 0]) cylinder(d=hole_length, hole_diameter);
        translate([-1, -1, 8]) rotate([0, 90, 0]) cylinder(d=hole_length, hole_diameter);
        translate([0, 4, 0]) rotate([20, 0, 0]) cylinder(d=hole_diameter+5, hole_length + length_offset);
    }
}