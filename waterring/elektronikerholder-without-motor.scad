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

difference() {
	cube([arduino_length + 2 * thickness, arduino_width + 2 * thickness, box_height + thickness]);
	translate ([thickness, thickness, thickness]) cube([arduino_length, arduino_width, box_height]);

	translate([arduino_length, arduino_power_plug_width + 1 * thickness, arduino_power_plug_height + thickness]) rotate([0, 90, 0]) cylinder(2 * thickness, r=arduino_power_plug_radius);
        translate([-1, sensor_width + 1 * thickness, sensor_height + thickness]) rotate([0, 90, 0]) cylinder(2 * thickness, r=tube_diameter/2);
}

