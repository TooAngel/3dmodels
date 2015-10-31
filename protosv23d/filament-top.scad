difference() {
    cube([165, 10, 2]);
    translate([10, 5, 0]) cylinder(2, r=2);
    translate([155, 5, 0]) cylinder(2, r=2);
}

translate([0, 10, 0]) cube([165, 2, 20]);
translate([0, 12, 0]) cube([2, 10, 10]);
translate([163, 12, 0]) cube([2, 10, 10]);
