box_height=35;

arduino_length=69;
arduino_width=54;
arduino_height=24;
arduino_power_plug_width=16;
arduino_power_plug_height=3;

motor_width=45;
tube_thickness=7;

out_height=20;
out_length=6;

in_height=11;
in_width=30;

cable_path=20;

thickness=1.2;


difference() {
	cube([arduino_length + 2 * thickness, arduino_width + 2 * thickness, box_height + 2 * thickness]);
	translate ([thickness, thickness, thickness]) cube([arduino_length, arduino_width, box_height + 2 * thickness]);
	translate([cable_path + thickness - out_length, arduino_width + 2 * thickness, arduino_height + tube_thickness/2 + thickness]) rotate([90, 0, 0]) cylinder(2 * thickness, r=tube_thickness/2);
	translate([arduino_length, arduino_power_plug_width + 1 * thickness, arduino_power_plug_height + thickness]) rotate([0, 90, 0]) cylinder(2 * thickness, r=tube_thickness/2);
	translate([0, arduino_power_plug_width + 1 * thickness, arduino_height + thickness]) rotate([0, 90, 0]) cylinder(2 * thickness, r=tube_thickness/2);
}



translate([0, arduino_width + 2 * thickness, 0]) {
	difference() {
		cube([arduino_length + 2 * thickness, motor_width + 1 * thickness, box_height + 2 * thickness]);
		translate ([thickness, 0, thickness]) cube([arduino_length, motor_width, box_height + 2 * thickness]);
		translate([arduino_length + 2 * thickness - out_length, motor_width + 1 * thickness,out_height + thickness]) rotate([90, 0, 0]) cylinder(2 * thickness, r=tube_thickness/2);
	translate([arduino_length, motor_width + 1 * thickness - in_width, in_height + thickness]) rotate([0, 90, 0]) cylinder(2 * thickness, r=tube_thickness/2);

	}
}