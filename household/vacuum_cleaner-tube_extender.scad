$fn=100;

cylinder_total_outter_diameter = 42;
cylinder_total_outter_height = 4;
cylinder_lower_height = 5;
cylinder_full_outter_diameter = 39.5; // => 1.5 on each side
cylinder_outter_diameter = 37;
cylinder_inner_diameter = 32 + 0.6; // +1 measure vs print offset
cylinder_height = 40;


cube_outter_width = 3;
cube_outter_depth = (cylinder_full_outter_diameter - cylinder_outter_diameter) / 2 + 1; // + 1 for fitting to ring
cube_inner_width = 3.6;
cube_inner_depth = 2.0;

snap_outter_width = 16 + 2; // + 2 for fitting to ring
snap_inner_width = 12.5;
snap_depth = 14;
snap_filled_height = 11;
snap_spring_width = 4;
snap_spring_height = 2;

screw_hole_diameter = 3;
screw_hole_height_offset = 6;

lock_pin_diameter = 4;

module getMechanic() {
    difference() {
        cylinder(d=cylinder_full_outter_diameter, cylinder_height);
        cylinder(d=cylinder_inner_diameter, cylinder_height);
        translate([-cylinder_full_outter_diameter / 2, -cylinder_full_outter_diameter + cylinder_inner_diameter / 2, 0]) cube([cylinder_full_outter_diameter, cylinder_full_outter_diameter, cylinder_height]);
    }
}

// total outter ring
difference() {
    cylinder(d=cylinder_total_outter_diameter, cylinder_lower_height);
    cylinder(d=cylinder_inner_diameter, cylinder_lower_height);
}

// lower full outter
translate([0, 0, cylinder_lower_height]) difference() {
    cylinder(d=cylinder_full_outter_diameter, cylinder_total_outter_height);
    cylinder(d=cylinder_inner_diameter, cylinder_total_outter_height);
}

// middle part
translate([0, 0, cylinder_total_outter_height + cylinder_lower_height]) {
    difference() {
        cylinder(d=cylinder_outter_diameter, cylinder_height);
        cylinder(d=cylinder_inner_diameter, cylinder_height);
        // snap mechanic
        translate([-snap_outter_width / 2 + (snap_outter_width - snap_inner_width) / 2, cylinder_inner_diameter / 2 + 1, 0]) cube([snap_inner_width, cube_outter_depth, cylinder_height]);
        // snap screw hole
        translate([0, cylinder_inner_diameter/2 - 2, screw_hole_height_offset]) rotate([-90, 0, 0]) cylinder(d=screw_hole_diameter, 10);
        // lock pin hole
        translate([-snap_inner_width / 2, cylinder_inner_diameter/2 - 2, cylinder_height - lock_pin_diameter]) cube([snap_inner_width, 5, lock_pin_diameter]);
    }


    // small outter pins
    rotate([0, 0, 90]) translate([-cube_outter_width / 2, cylinder_outter_diameter / 2 - 1, 0]) cube([cube_outter_width, cube_outter_depth, cylinder_height]);
    rotate([0, 0, 180]) translate([-cube_outter_width / 2, cylinder_outter_diameter / 2 - 1, 0]) cube([cube_outter_width, cube_outter_depth, cylinder_height]);
    rotate([0, 0, 270]) translate([-cube_outter_width / 2, cylinder_outter_diameter / 2 - 1, 0]) cube([cube_outter_width, cube_outter_depth, cylinder_height]);

    // small inner pin
    rotate([0, 0, 180]) translate([-cube_inner_width / 2, cylinder_inner_diameter / 2 - cube_inner_depth, cylinder_height]) cube([cube_inner_width, cube_inner_depth, cylinder_lower_height]);
    
    // snap holder
    difference() {
        getMechanic();
        translate([-snap_outter_width / 2, cylinder_inner_diameter / 2 - 2, 0]) {
            translate([(snap_outter_width - snap_inner_width) / 2, 0, snap_filled_height]) cube([snap_inner_width, snap_depth, cylinder_height - snap_filled_height]);
            translate([(snap_outter_width - snap_inner_width) / 2 + snap_inner_width / 2 - snap_spring_width / 2, 0, snap_filled_height - snap_spring_height]) cube([snap_spring_width, snap_depth, snap_spring_height]);
        }
        translate([0, cylinder_inner_diameter/2 - 2, screw_hole_height_offset]) rotate([-90, 0, 0]) cylinder(d=screw_hole_diameter, 10);
    }
}

// upper full outter
translate([0, 0, cylinder_total_outter_height + cylinder_lower_height + cylinder_height]) {
    difference() {
        cylinder(d=cylinder_full_outter_diameter, cylinder_total_outter_height);
        cylinder(d=cylinder_inner_diameter, cylinder_total_outter_height);
        // snap mechanic
        translate([-snap_outter_width / 2 + (snap_outter_width - snap_inner_width) / 2, cylinder_inner_diameter / 2 + 1, 0]) cube([snap_inner_width, 2 * cube_outter_depth, cylinder_height]);
    } 
}

// top cone
translate([0, 0, cylinder_total_outter_height + cylinder_lower_height + cylinder_height + cylinder_total_outter_height]) {
    difference() {
        cylinder(d1=cylinder_full_outter_diameter, d2=cylinder_full_outter_diameter-2, cylinder_total_outter_height);
        cylinder(d=cylinder_inner_diameter, cylinder_total_outter_height);
        // snap mechanic
        translate([-snap_outter_width / 2 + (snap_outter_width - snap_inner_width) / 2, cylinder_inner_diameter / 2 + 1, 0]) cube([snap_inner_width, 2 * cube_outter_depth, cylinder_height]);
    } 
}