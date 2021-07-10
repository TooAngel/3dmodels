$fn=100;

rotate([180, 0, 0]) {
    difference() {
        scale([1.2, 1, 1]) cylinder(7, d=15);
        translate([0, 0, 5]) cylinder(7, d=9);
        translate([0, 0, 3]) cylinder(7, d=4);
        translate([-15, 0, -4]) rotate([0, 90, 0]) cylinder(30, d=16);
    }
}