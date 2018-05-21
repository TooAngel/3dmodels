include <../relocately-logo.scad>


difference() {
 cylinder(1, r=45);
 translate([0, 5, 0]) poly_path3725(5, 1.0);
}

difference() {
translate([-10, -63, 0]) cube([20,  20, 1]);
translate([0, -63, 0]) cylinder(1, r=2);
}

difference() {
translate([0, -63, 0]) cylinder(1, r=10);
translate([0, -63, 0]) cylinder(1, r=2);
}
