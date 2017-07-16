box_height=37;

arduino_length=72;
arduino_width=54;
arduino_height=24;
arduino_power_plug_width=16;
arduino_power_plug_height=6;
arduino_power_plug_radius=7;


tube_diameter=7;

// Which side the sensor
sensor_width=16;
sensor_height=30;

thickness=2;

difference() {
	cube([arduino_length + 2 * thickness, arduino_width + 2 * thickness, box_height + thickness]);
	translate ([thickness, thickness, thickness]) cube([arduino_length, arduino_width, box_height]);

	translate([arduino_length, arduino_power_plug_width + 1 * thickness, arduino_power_plug_height + thickness]) rotate([0, 90, 0]) cylinder(2 * thickness, r=arduino_power_plug_radius);
        translate([-1, sensor_width + 1 * thickness, sensor_height + thickness]) rotate([0, 90, 0]) cylinder(2 * thickness, r=tube_diameter/2);
}

