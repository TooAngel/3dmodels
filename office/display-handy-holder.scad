/*
 * Handy holder for the top of a display (C) by Tobias Wilken
 */

length = 90;
monitor_width = 20;
monitor_height = 20;
mobile_width = 10;
mobile_height = 15;
thickness=2;
rotate([90, 0, 0])
difference() {
    cube([monitor_width + 2 * thickness, length, monitor_height + mobile_height + thickness]);
    // monitor
    translate([thickness, 0, mobile_height + thickness]) cube([monitor_width, length, monitor_height]);
    // mobile
    translate([(monitor_width + 2 * thickness - mobile_width) / 2, 0, 0]) cube([mobile_width, length, mobile_height]);
     translate([2 * thickness, 8, 16]) rotate([-90, 0,  90]) linear_extrude(3 * thickness) text("Adelaide", size=14, font="Deftone Stylus:style=Regular");
    translate([monitor_width, length -8, 16]) rotate([-90, 0,  -90]) linear_extrude(3 * thickness) text("Adelaide", size=14, font="Deftone Stylus:style=Regular");
}
