$fn=180;

thickness = 2;

// rest



length_wheel = 40;


length_step_in = 45;
width_step_in = 5;
height_step_in = 5;

width_axis_back_holder = 7;
diameter_axis_back_axis_clip = 5;
width_axis_back_axis_clip = 3;

// Back
back_axis_holder_length = 15;
back_diameter_axis = 5.7;
back_axis_clip_end = 5.3;
back_axis_width = 12;

module axis() {
    cube([back_axis_holder_length, back_diameter_axis, width_axis_back_holder]);
    translate([back_axis_holder_length / 2, back_diameter_axis / 2, width_axis_back_holder]) {
        cylinder(d=back_diameter_axis, back_axis_width - width_axis_back_axis_clip - 1);
            
        translate([0, 0, back_axis_width - width_axis_back_axis_clip - 1]) {
            difference() {
                cylinder(d=diameter_axis_back_axis_clip, width_axis_back_axis_clip);
                translate([-1/2, - diameter_axis_back_axis_clip / 2, 0]) cube([1, diameter_axis_back_axis_clip, width_axis_back_axis_clip]);
            }
            
            translate([0, 0, width_axis_back_axis_clip]) difference() {
                cylinder(d=back_axis_clip_end, 1);
                translate([-1/2, - back_axis_clip_end / 2, 0]) cube([1, back_axis_clip_end, 1]);
            }
        }
    }
}

module back() {
    //width = 84;
    wheel_width = 11;
    
    back_length = 1;

    back_bumper_width = 77;
    back_bumper_length = 5;
    back_bumper_light_diameter_outter = 5.2;
    back_bumper_light_diameter_inner = 6;
    back_bumper_light_y_offset = 2;
    back_bumper_light_diameter = back_bumper_light_diameter_inner;

    trunk_width = 56;
    
    trunk_length = 40;
    trunk_height = 19;

    trunk_hole_diameter = 5.8;
    trunk_hole_x_offset = 0;

    trunk_clip_length = 5;

    back_bumper_height = 2 * thickness + back_bumper_light_diameter + 2;
    back_height = back_bumper_height + trunk_height;
        
    back_seat_width = 80;
   
    width = 2 * thickness + trunk_width + 2 * wheel_width;

    // bumper
    difference() {
        translate([0, (width - back_bumper_width) / 2, 0]) cube([back_bumper_length, back_bumper_width, back_bumper_height]);
        
        // lights
        translate([0, wheel_width + thickness, thickness + back_bumper_light_diameter / 2]) {
            translate([0, back_bumper_light_diameter / 2 + back_bumper_light_y_offset, 0]) rotate([0, 90, 0]) cylinder(d1=back_bumper_light_diameter_outter, d2=back_bumper_light_diameter_inner, 2 * back_bumper_length);
            translate([0, trunk_width - back_bumper_light_diameter / 2 - back_bumper_light_y_offset, 0]) rotate([0, 90, 0]) cylinder(d1=back_bumper_light_diameter_outter, d2=back_bumper_light_diameter_inner, 2 * back_bumper_length);
        }
        // hole
        translate([back_bumper_length, (width - back_bumper_width) / 2 + back_bumper_width / 2, 0]) cylinder(d=trunk_hole_diameter, 2 * back_bumper_height);
    }
        
    // trunk
    translate([back_bumper_length, wheel_width, 0])  difference() {
        cube([trunk_length, 2* thickness + trunk_width, back_height]);
        
        // actual trunk
        translate([0, thickness, back_bumper_height]) cube([trunk_length, trunk_width, back_height]);
        
        // below trunk
        translate([0, thickness, - back_height + back_bumper_height - thickness]) cube([trunk_length, trunk_width, back_height]);
        
        // slope
        translate([0, 0,back_bumper_height]) rotate([0, -60, 0]) cube([2 * back_height, width, 2 * back_height]);
        
        // hole
        translate([trunk_hole_x_offset, thickness + trunk_width / 2, back_bumper_height - 1.5 * thickness]) cylinder(d=trunk_hole_diameter, 2 * thickness);
    }
   
    // trunk clips
   translate([back_bumper_length + trunk_length - trunk_clip_length, (width - back_seat_width) / 2 + thickness, back_height])  difference() {
       
      cube([trunk_clip_length, back_seat_width - 2 * thickness, thickness]); 
      translate([0, wheel_width - (width - back_seat_width) / 2, 0]) cube([trunk_clip_length, trunk_width, thickness]);
   }
   
    // axis back
    translate([back_bumper_length + trunk_length / 2 - back_axis_holder_length / 2, wheel_width, 0]) rotate([90, 0, 0]) axis();
    translate([back_bumper_length + trunk_length / 2 - back_axis_holder_length / 2, width - wheel_width, back_diameter_axis]) rotate([-90, 0, 0]) axis();
               
    // trunk border to seat area
    translate([back_bumper_length + trunk_length, 0, 0])   cube([thickness, width, thickness]);
    translate([back_bumper_length + trunk_length, thickness + (width - back_seat_width) / 2, thickness])  difference() {
         cube([thickness, back_seat_width - 2 * thickness, back_height]);
         // lights
        translate([0, wheel_width , back_bumper_light_diameter / 2]) {
            translate([0, back_bumper_light_diameter / 2, 0]) rotate([0, 90, 0]) cylinder(d=back_bumper_light_diameter, 2 * back_bumper_length);
            translate([0, trunk_width - back_bumper_light_diameter / 2 - thickness, 0]) rotate([0, 90, 0]) cylinder(d=back_bumper_light_diameter,2 * back_bumper_length);
        }
    }
}

//back();

module front() {
    seating_area_length = 7;
    
    steering_wheel_length = 9;
    steering_wheel_width = 9;
    steering_wheel_height = 28;
    steering_wheel_hole_diameter = 4.9;
    steering_wheel_y_offset = 52;
    
    connect_hole_length = 3;
    connect_hole_width = 12;
    
    fender_height = 28;
    
    motor_length = 39;
    motor_width = 54;
    
    front_axis_x_offset = 20;
    front_axis_length = 13;
    front_axis_height = 8;
    front_axis_hole_height = 6;
    front_axis_hole_width = 4;
        
    front_wheels_y_rotate = 25;
    wheel_width = 11;
    
    radiator_length = 8;
    radiator_y_offset = 5;
   
    radiator_hole_length = 3;
    radiator_hole_width = 8;
    radiator_hole_x_offsets = 4;
    
    
    light_diameter_outter = 5.2;
    light_diameter_inner = 6;

    // old
    height_front_wheels = 9; // Couldn't measure properly
    width = motor_width + 2 * thickness + 2 * wheel_width; // 82;

    // steering wheel
    difference() {
        cube([seating_area_length, width, thickness]);
        
        //connect hole
        translate([steering_wheel_length - connect_hole_length, width / 2 - connect_hole_width / 2, 0]) cube([connect_hole_length, connect_hole_width, thickness]);
    }
    translate([0, steering_wheel_y_offset, 0]) difference() {
        cube([steering_wheel_length, steering_wheel_width, steering_wheel_height]);
        translate([thickness, 0.5 * thickness, 0]) cube([steering_wheel_length - 1 * thickness, steering_wheel_width - 1 * thickness, steering_wheel_height]);
        
        translate([0, steering_wheel_length / 2, 25]) rotate([0, 90, 0]) cylinder(d=steering_wheel_hole_diameter, 2 * steering_wheel_length);
        translate([0, steering_wheel_length / 2 - steering_wheel_hole_diameter / 2, 25]) cube([2 * steering_wheel_length, steering_wheel_hole_diameter, 2 * steering_wheel_length]);
    }
    
    module frontWheels() {
        front_wheells_upper_cut_length = 20;
        translate([-front_wheells_upper_cut_length * cos(front_wheels_y_rotate), -thickness, sin(front_wheels_y_rotate) * front_wheells_upper_cut_length + thickness]) 
            rotate([0, front_wheels_y_rotate, 0]) cube([front_wheells_upper_cut_length, (width - motor_width) / 2 + thickness, fender_height + 10]);
        translate([thickness, 0, 0]) 
            rotate([0, front_wheels_y_rotate, 0]) cube([20, wheel_width, (fender_height - thickness) / cos(front_wheels_y_rotate)]);
        translate([thickness - 1 + tan(front_wheels_y_rotate) * fender_height, 0, 0]) cube([length_wheel, wheel_width, fender_height - thickness]);
    }
    
    translate([seating_area_length, 0, 0]) difference() {
        cube([motor_length + thickness, width, fender_height]);
        
        translate([-seating_area_length + steering_wheel_length - connect_hole_length, width / 2 - connect_hole_width / 2, 0]) cube([connect_hole_length, connect_hole_width, thickness]);
        
        // front wheels
        frontWheels();
        translate([0, width - wheel_width, 0]) frontWheels();
        
        // axis
        translate([front_axis_x_offset, 0, 0]) cube([front_axis_length, width, front_axis_height]);
        translate([front_axis_x_offset - thickness, width / 2 - front_axis_hole_width / 2, 0]) cube([front_axis_length + 2 * thickness, front_axis_hole_width, front_axis_hole_height]);
        
        // front area
        // motor
        translate([0, (width - motor_width) / 2, height_front_wheels]) cube([motor_length, motor_width, fender_height]);
        
        translate([0, (width - motor_width) / 2, thickness]) cube([front_axis_x_offset - thickness, motor_width, fender_height]);
        
        lights_y_offset = 9;
        lights_z_offset = 20;
        
        // lights
        translate([motor_length, wheel_width + thickness + lights_y_offset, lights_z_offset]) rotate([0, 90, 0]) cylinder(d1=light_diameter_outter, d2=light_diameter_inner, thickness);
        translate([motor_length, wheel_width + motor_width + thickness - lights_y_offset, lights_z_offset]) rotate([0, 90, 0]) cylinder(d1=light_diameter_outter, d2=light_diameter_inner, thickness);
    }
     
    translate([seating_area_length + motor_length, 0, radiator_y_offset]) {
        difference() {
            cube([radiator_length, width, thickness]);
            translate([radiator_hole_x_offsets, width / 2 - radiator_hole_width / 2, 0]) cube([radiator_hole_length, radiator_hole_width, thickness]);
        }
    }
}

translate([100, 0, 0]) front();


