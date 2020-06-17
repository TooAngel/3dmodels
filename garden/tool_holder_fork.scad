width_between = 35;

thickness = 5;
height = 20;
width_holder = 25;
length_holder = 20;
height_holder = 20;

screw_head_diameter = 10;
screw_body_diameter = 5;
screw_head_height = 4;

difference() {
    cube([thickness, 2 * width_holder + width_between, height]);
    translate([0, (2 * width_holder + width_between) / 2, height / 2]) rotate([0, 90, 0]) cylinder(r=screw_body_diameter/2, thickness);
    translate([thickness-screw_head_height, (2 * width_holder + width_between) / 2, height / 2]) rotate([0, 90, 0]) cylinder(r1=screw_body_diameter/2, r2=screw_head_diameter/2, thickness);
}

// Left
cube([2 * thickness + length_holder, width_holder, thickness]);
translate([thickness + length_holder, 0, 0]) cube([thickness, width_holder, height_holder]);

// Right
translate([0, width_holder + width_between, 0]) {
    cube([2 * thickness + length_holder, width_holder, thickness]);
    translate([thickness + length_holder, 0, 0]) cube([thickness, width_holder, height_holder]);
}