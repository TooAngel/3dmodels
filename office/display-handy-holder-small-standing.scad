/*
 * Handy holder for the top of a display (C) by Tobias Wilken
 */

length = 70;
monitor_width = 12;
monitor_height = 20;
mobile_width = 10;
mobile_height = 36; //15 + 21
thickness=2;
rotate([90, 0, 0]) {
difference() {
    cube([monitor_width + 2 * thickness, length, monitor_height + mobile_height + thickness]);
    // monitor
    translate([thickness, 0, mobile_height + thickness]) cube([monitor_width, length, monitor_height]);
    // mobile
    translate([(monitor_width + 2 * thickness - mobile_width) / 2, 0, 0]) cube([mobile_width, length, mobile_height]);
     translate([2 * thickness, 12, 45]) rotate([-90, 0,  90]) linear_extrude(3 * thickness) text("RAMIREZ", size=7, font="CutOutsFLF:style=Bold");
    //translate([2 * thickness, 18, 48]) rotate([-90, 0,  90]) linear_extrude(3 * thickness) text("Master", size=7, font="CutOutsFLF:style=Bold");
    translate([monitor_width, length -22, 45]) rotate([-90, 0,  -90]) linear_extrude(3 * thickness) text("Emily", size=7, font="CutOutsFLF:style=Bold");
    //translate([monitor_width, length -8, 26]) rotate([-90, 0,  -90]) linear_extrude(3 * thickness) text("Accelerator", size=7, font="CutOutsFLF:style=Bold");
}
translate([0, 0, 15]) cube([monitor_width + 2 * thickness, length, thickness]);
}
