thickness = 5;
width = 100;
curve_radius = 20;
curve_radius_inner = curve_radius - thickness;


cube([width, thickness, thickness]);

// LEFT
translate([0, curve_radius, 0]) {
    difference() {
        cylinder(h=thickness, r=curve_radius);
        translate([0, 0, -1]) cylinder(h=thickness + 2, r=curve_radius_inner);
        translate([0, -curve_radius, -1]) cube([curve_radius, 2 * curve_radius, thickness + 2]);
    }
}

translate([0, 2 * curve_radius - thickness, 0]) cube([width/2 - 2 * curve_radius + thickness, thickness, thickness]);

translate([width/2 - 2 * curve_radius + thickness, 3 * curve_radius - thickness, 0]) {
    difference() {
        cylinder(h=thickness, r=curve_radius);
        translate([0, 0, -1]) cylinder(h=thickness + 2, r=curve_radius_inner);
        translate([-curve_radius, -curve_radius, -1]) cube([curve_radius, 2 * curve_radius, thickness + 2]);
        translate([-1, 0, -1]) cube([curve_radius + 1, curve_radius, thickness + 2]);
    }
}


// RIGHT
translate([width, curve_radius, 0]) {
    difference() {
        cylinder(h=thickness, r=curve_radius);
        translate([0, 0, -1]) cylinder(h=12, r=curve_radius_inner);
        translate([-curve_radius, -curve_radius, -1]) cube([curve_radius, 2 * curve_radius, thickness + 2]);
    }
}
translate([width/2 + 2 * curve_radius - thickness, 2 * curve_radius - thickness, 0]) cube([width/2 - 2 * curve_radius + thickness, thickness, thickness]);

translate([width / 2 + 2 * curve_radius - thickness, 3 * curve_radius - thickness, 0]) {
    difference() {
        cylinder(h=thickness, r=curve_radius);
        translate([0, 0, -1]) cylinder(h=thickness + 2, r=curve_radius_inner);
        translate([0, -curve_radius, -1]) cube([curve_radius, 2 * curve_radius, thickness + 2]);
        translate([-curve_radius, 0, -1]) cube([curve_radius + 1, curve_radius, thickness + 2]);
    }
}

// TOP
translate([width/2, 3 * curve_radius - thickness, 0]) {
    difference() {
        cylinder(h=thickness, r=curve_radius);
        translate([0, -curve_radius, -1]) cylinder(h=thickness + 2, r=curve_radius);
    }
}


hook_rotate = 35;

translate([width / 2 + curve_radius - thickness/2, 3.5 * curve_radius , 0]) {
    rotate([0, 0, hook_rotate]) {
        difference() {
            cylinder(h=thickness, r=curve_radius);
            translate([0, 0, -1]) cylinder(h=thickness + 2, r=curve_radius_inner);
            translate([-curve_radius, -curve_radius, -1]) cube([2 * curve_radius, curve_radius, thickness + 2]);
            translate([0, -curve_radius, -1]) cube([curve_radius, 2 * curve_radius, thickness + 2]);
        }

        translate([0, 2 * curve_radius - thickness, 0]) {
            difference() {
                cylinder(h=thickness, r=curve_radius);
                translate([0, 0, -1]) cylinder(h=thickness + 2, r=curve_radius_inner);
                translate([-30, -30, -1]) cube([30, 30, thickness + 2]);
                rotate([0, 0, -35]) translate([-30, -30, -1]) cube([30, 30, thickness + 2]);
            }
        }
    }
}