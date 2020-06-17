width_between = 50;

thickness = 5;
height = 20;
width_holder = 25;
length_holder = 30;
height_holder = 20;

difference() {
    cube([thickness, 2 * width_holder + width_between, height]);
    translate([0, (2 * width_holder + width_between) / 2, height / 2]) rotate([0, 90, 0]) cylinder(r=5, 100);
}

// Left
cube([2 * thickness + length_holder, width_holder, thickness]);
translate([thickness + length_holder, 0, 0]) cube([thickness, width_holder, height_holder]);

// Right
translate([0, width_holder + width_between, 0]) {
    cube([2 * thickness + length_holder, width_holder, thickness]);
    translate([thickness + length_holder, 0, 0]) cube([thickness, width_holder, height_holder]);
}