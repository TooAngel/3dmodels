box_height=35;

arduino_length=72;
arduino_width=54;
arduino_height=24;
arduino_power_plug_width=16;
arduino_power_plug_height=3;

motor_width=45;
motor_power_plug_width=16;
motor_power_plug_height=25;
tube_thickness=7;

arduino_power_plug_width=16;
arduino_power_plug_height=3;

out_height=20;
out_length=14;

in_height=13;
in_width=30;

cable_path_length=10;
cable_path_height=30;

// Which side the sensor
sensor_width=16;
sensor_height=30;

thickness=2;

difference() {
	cube([arduino_length + 2 * thickness, arduino_width + 2 * thickness, box_height + thickness]);
	translate ([thickness, thickness, thickness]) cube([arduino_length, arduino_width, box_height]);
        translate([cable_path_length + thickness, arduino_width + 2 * thickness + 1, cable_path_height + thickness]) rotate([90, 0, 0]) cylinder(2 * thickness, r=tube_thickness/2);
	translate([arduino_length, arduino_power_plug_width + 1 * thickness, arduino_power_plug_height + thickness]) rotate([0, 90, 0]) cylinder(2 * thickness, r=tube_thickness/2);
        translate([-1, sensor_width + 1 * thickness, sensor_height + thickness]) rotate([0, 90, 0]) cylinder(2 * thickness, r=tube_thickness/2);
}

translate([0, arduino_width + 2 * thickness, 0]) {
	difference() {
		cube([arduino_length + 2 * thickness, motor_width + 1 * thickness, box_height + thickness]);
		translate ([thickness, 0, thickness]) cube([arduino_length, motor_width, box_height]);
		translate([arduino_length + 2 * thickness - out_length, motor_width + 1 * thickness,out_height + thickness]) rotate([90, 0, 0]) cylinder(2 * thickness, r=tube_thickness/2);
                translate([arduino_length + 2 * thickness - out_length + 12, motor_width, out_height + thickness - 12]) rotate([-90, 180, 0]) linear_extrude(2 * thickness) text("OUT", size=8);
                translate([arduino_length + 1, motor_width + 1 * thickness - in_width, in_height + thickness]) rotate([0, 90, 0]) cylinder(2 * thickness, r=tube_thickness/2);
                translate([arduino_length + 1, motor_width - in_width - 4, in_height + thickness + 4]) rotate([90, 0, 90]) linear_extrude(2 * thickness) text("IN", size=8); 
                translate([-1, motor_power_plug_width, motor_power_plug_height + thickness]) rotate([0, 90, 0]) cylinder(2 * thickness, r=tube_thickness/2); 
	}
}
