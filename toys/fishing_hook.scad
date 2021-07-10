$fn = 120;

stick_diameter = 6.1;
thickness = 1;

hock_diameter = 4;

stick_cup_height = 10;

hook_arm_length = 20;

difference() {
    cylinder(d=stick_diameter + 2 * thickness, stick_cup_height + thickness);
    translate([0, 0, thickness]) cylinder(d=stick_diameter, stick_cup_height);
}



translate([3 * stick_diameter + 2 * thickness - 0.3, hook_arm_length,  hock_diameter / 2]) rotate_extrude(angle=180, convexity=10) translate([20, 0]) circle(hock_diameter - 2 * thickness);
//rotate_extrude(angle=90, convexity=10) translate([20, 0]) circle(stick_diameter - 2 * thickness);
difference() {
    translate([0, hook_arm_length + hock_diameter / 2 - 2 * thickness, hock_diameter / 2]) rotate([90,0,0]) cylinder(r=hock_diameter - 2 * thickness, h=hook_arm_length);
    cylinder(d=hock_diameter + 2 * thickness, stick_cup_height + thickness);
}

translate([40, hook_arm_length, hock_diameter / 2]) sphere(d=hock_diameter);