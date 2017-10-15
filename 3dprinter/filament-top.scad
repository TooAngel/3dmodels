length = 165;
height = 20;
thickness = 4;
fixture_height = 20;
top_height = 130;

difference() {
    cube([length, fixture_height, thickness]);
    translate([10, 10, 0]) cylinder(thickness, r=2);
    translate([155, 10, 0]) cylinder(thickness, r=2);
}

translate([0, fixture_height, 0]) cube([165, thickness, height]);

// top
difference() {
    translate([0, fixture_height + thickness, 0]) cube([thickness, top_height, height]);
    translate([-thickness / 4, height + top_height - 5, height / 2]) rotate([0, 90, 0]) cylinder(2 * thickness, r=5);
    translate([-thickness / 4, height + top_height - 7, 0]) cube([2 * thickness, 4, 10]);
}
difference() {
    translate([length - thickness, fixture_height + thickness, 0]) cube([thickness, top_height, height]);
    translate([length - thickness - thickness / 4, height + top_height - 5, height / 2]) rotate([0, 90, 0]) cylinder(2 * thickness, r=5);
    translate([length - thickness - thickness / 4, height + top_height - 7, 0]) cube([2 * thickness, 4, 10]);
}
