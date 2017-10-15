box_height=45;

arduino_length=72;
arduino_width=54;
arduino_height=24;
arduino_power_plug_width=16;
arduino_power_plug_height=6;
arduino_power_plug_radius=7;

motor_width=45;
motor_power_plug_width=16;
motor_power_plug_height=25;
tube_diameter=7;

out_height=20;
out_length=14;

in_height=13;
in_width=30;

cable_path_length=10;
cable_path_height=40;

// Which side the sensor
sensor_width=16;
sensor_height=40;

thickness=2;

motor_bed_position_length=15;
motor_bed_position_width=5;
motor_bed_length=30;
motor_bed_width=30;
motor_bed_height=19;
motor_bed_height_lower=25;
motor_diameter=28;

difference() {
	cube([arduino_length + 2 * thickness, arduino_width + 2 * thickness, box_height + thickness]);
	translate ([thickness, thickness, thickness]) cube([arduino_length, arduino_width, box_height]);
        translate([cable_path_length + thickness, arduino_width + 2 * thickness + 1, cable_path_height + thickness]) rotate([90, 0, 0]) cylinder(2 * thickness, r=tube_diameter/2);
	translate([arduino_length, arduino_power_plug_width + 1 * thickness, arduino_power_plug_height + thickness]) rotate([0, 90, 0]) cylinder(2 * thickness, r=arduino_power_plug_radius);
        translate([-1, sensor_width + 1 * thickness, sensor_height + thickness]) rotate([0, 90, 0]) cylinder(2 * thickness, r=tube_diameter/2);
}

translate([0, arduino_width + 2 * thickness, 0]) {
    // motor frame
    difference() {
	cube([arduino_length + 2 * thickness, motor_width + 1 * thickness, box_height + thickness]);
	translate ([thickness, 0, thickness]) cube([arduino_length, motor_width, box_height]);
	translate([arduino_length + 2 * thickness - out_length, motor_width + 1 * thickness,out_height + thickness]) rotate([90, 0, 0]) cylinder(2 * thickness, r=tube_diameter/2);
        translate([arduino_length + 2 * thickness - out_length + 12, motor_width + thickness/2, out_height + thickness - 12]) rotate([-90, 180, 0]) linear_extrude(thickness / 2) text("OUT", size=8);
        translate([arduino_length + 1, motor_width + 1 * thickness - in_width, in_height + thickness]) rotate([0, 90, 0]) cylinder(2 * thickness, r=tube_diameter/2);
        translate([arduino_length + 1.5 * thickness, motor_width - in_width - 4, in_height + thickness + 4]) rotate([90, 0, 90]) linear_extrude(thickness / 2) text("IN", size=8); 
        translate([-1, motor_power_plug_width, motor_power_plug_height + thickness]) rotate([0, 90, 0]) cylinder(2 * thickness, r=tube_diameter/2); 
    }
        
    //motorbed
    difference() {
        translate([motor_bed_position_length, motor_bed_position_width, thickness]) cube([motor_bed_length, motor_bed_width, motor_bed_height]);
        translate([motor_bed_position_length - motor_bed_width, motor_bed_position_width + motor_diameter/2 + (motor_bed_width - motor_diameter) / 2, motor_bed_height_lower]) rotate([90, 0, 90]) cylinder(motor_bed_width * 2, r=motor_diameter/2);    
    }
    
}
