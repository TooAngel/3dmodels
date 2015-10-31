length = 165;
height = 5;
thickness = 2;
fixture_height = 20;

difference() {
    cube([length, fixture_height, thickness]);
    translate([10, 10, 0]) cylinder(thickness, r=2);
    translate([155, 10, 0]) cylinder(thickness, r=2);
}

translate([0, fixture_height, 0]) cube([165, thickness, height]);
translate([0, fixture_height + thickness, 0]) cube([thickness, 10, height]);
translate([length - thickness, fixture_height + thickness, 0]) cube([thickness, 10, height]);
