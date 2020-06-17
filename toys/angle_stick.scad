diameter_stick = 3;
length_stick = 70;

diameter_top = 15;
thickness_top = 2;

diameter_top_hole = 2;

diameter_holder = 2;
length_holder = 6;

$fn=180;

rotate([0, -90, 0]) {
    cylinder(d=diameter_stick, length_stick);
    translate([diameter_top / 2 - diameter_stick / 2, 0, length_stick]) difference() {
        cylinder(d=diameter_top, thickness_top);
        translate([diameter_top / 2 - diameter_top_hole, 0, 0]) cylinder(d=diameter_top_hole, thickness_top);
    }

    translate([0, length_holder / 2, diameter_holder / 2]) rotate([90, 0, 0]) cylinder(d=diameter_holder, length_holder);
}