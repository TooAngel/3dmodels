thickness = 2;
length = 134;
width = 82;
height_base_plate = 31;

height_front_wheels = 9; // Couldn't measure properly

x_distance_front_axis = 110;
length_axis = 12;
height_axis = 7;
width_hole_axis = 4;

width_trunk = 56;
length_trunk = 40;

length_bumper_back = 5;

length_wheel = 40;
width_wheel = 11;

length_step_in = 45;
width_step_in = 5;
height_step_in = 5;

length_motor = 40;
width_motor = 54;

length_axis_back_holder = 15;
width_axis_back_holder = 7;

diameter_axis_back_axis = 6;
width_axis_back_axis = 10;
diameter_axis_back_axis_clip = 5;
width_axis_back_axis_clip = 3;

module body() {
    difference() {
        cube([length, width, height_base_plate]);
        
        // bumper back
        translate([0, 0, thickness]) cube([length_bumper_back, width, height_base_plate - thickness]);

        // wheels back
        translate([length_bumper_back, 0, 0]) cube([length_wheel, width_wheel, height_base_plate - thickness]);
        translate([length_bumper_back, width - width_wheel, 0]) cube([length_wheel, width_wheel, height_base_plate - thickness]);
        
        // trunk
        translate([length_bumper_back, width_wheel + thickness, thickness]) cube([length_trunk, width_trunk, height_base_plate]);
        // trunk top
        translate([0, 0, height_base_plate - thickness]) cube([length_trunk, width, thickness]);
        // trunk slope
        translate([length_bumper_back, 0, thickness]) rotate([0, -60, 0]) cube([2 * height_base_plate, width, 2 * height_base_plate]);
        // trunk border to seat area
        translate([0, 0, height_step_in]) cube([length_bumper_back + length_trunk + thickness, width_step_in / 2, height_base_plate]);
        translate([0, width - width_step_in / 2, height_step_in]) cube([length_bumper_back + length_trunk + thickness, width_step_in / 2, height_base_plate]);
        
        // seating area
        translate([length_bumper_back + length_trunk + thickness, width_step_in, thickness]) cube([length_step_in, width - 2 * width_step_in, height_base_plate]);
        translate([length_bumper_back + length_trunk + thickness, 0, height_step_in]) cube([length_step_in, width, height_base_plate]);
        
        // front area
        // motor
        length_temp = length_bumper_back + length_trunk + thickness + length_step_in;
        translate([length_temp, width_wheel + thickness, height_front_wheels]) cube([length_motor, width_motor, height_base_plate]);
        
        translate([length_temp, width_wheel + thickness, thickness]) cube([x_distance_front_axis - thickness - length_temp, width_motor, height_base_plate]);
        translate([x_distance_front_axis + length_axis + thickness, width_wheel + thickness, thickness]) cube([length - thickness - length_temp, width_motor, height_base_plate]);
        
        
        // front wheels
        translate([length_temp + thickness + 11, 0, 0]) cube([length_wheel, width_wheel, height_base_plate - thickness]);
        translate([length_temp + thickness, 0, 0]) rotate([0, 20, 0]) cube([length_wheel, width_wheel, height_base_plate]);
        translate([length_temp - 9.35, 0, 8.5]) rotate([0, 20, 0]) cube([10, width_wheel + thickness, height_base_plate]);
        
        translate([length_temp + thickness + 11, width - width_wheel, 0]) cube([length_wheel, width_wheel, height_base_plate - thickness]);
        translate([length_temp + thickness, width - width_wheel, 0]) rotate([0, 20, 0]) cube([length_wheel, width_wheel, height_base_plate]);
        translate([length_temp - 9.35, width - width_wheel - 2 * thickness, 8.5]) rotate([0, 20, 0]) cube([10, width_wheel + 2 * thickness, height_base_plate]);
        
        // axis
        translate([x_distance_front_axis, 0, 0]) cube([length_axis, width, height_axis]);
        translate([x_distance_front_axis - thickness, width / 2 - width_hole_axis / 2, 0]) cube([length_axis + 2 * thickness, width_hole_axis, height_axis]);
    }
}


module axis() {
    cube([length_axis_back_holder, diameter_axis_back_axis, width_axis_back_holder]);
    translate([length_axis_back_holder / 2, diameter_axis_back_axis / 2, width_axis_back_holder]) cylinder(d=diameter_axis_back_axis, width_axis_back_axis - width_axis_back_axis_clip - 1);
    difference() {
        translate([length_axis_back_holder / 2, diameter_axis_back_axis / 2, width_axis_back_holder + width_axis_back_axis - width_axis_back_axis_clip - 1]) cylinder(d=diameter_axis_back_axis_clip, width_axis_back_axis_clip);
        translate([length_axis_back_holder / 2 - diameter_axis_back_axis_clip / 2, diameter_axis_back_axis / 2 - 1/2, width_axis_back_holder + width_axis_back_axis - width_axis_back_axis_clip - 1]) cube([diameter_axis_back_axis_clip, 1, width_axis_back_axis_clip]);
    }
    difference() {
        translate([length_axis_back_holder / 2, diameter_axis_back_axis / 2, width_axis_back_holder + width_axis_back_axis - 1]) cylinder(d=diameter_axis_back_axis, 1);
        translate([length_axis_back_holder / 2 - diameter_axis_back_axis / 2, diameter_axis_back_axis / 2 - 1/2, width_axis_back_holder + width_axis_back_axis - 1]) cube([diameter_axis_back_axis, 1, 1]);
    }
}

body();

// axis back
translate([length_bumper_back + length_trunk / 2 - length_axis_back_holder / 2, width_wheel, 0]) rotate([90, 0, 0]) axis();
translate([length_bumper_back + length_trunk / 2 - length_axis_back_holder / 2, width - width_wheel, diameter_axis_back_axis]) rotate([-90, 0, 0]) axis();
