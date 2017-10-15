include <../threads.scad>

inner_radius = 10;
height = 20;

monitor_width = 26;
monitor_height = 20;
length = 70;
thickness=3;

//rotate([180, 0, 0])
difference() {
    cube([length, monitor_width + 2 * thickness, monitor_height + thickness]);
    translate([0, thickness, 0]) cube([length, monitor_width, monitor_height]);
    translate([14, 2 * thickness, 13]) rotate([90, 0,  0]) linear_extrude(3 * thickness) text("TooAngel", size=7, font="CutOutsFLF:style=Bold");
    translate([18, 2 * thickness, 5]) rotate([90, 0,  0]) linear_extrude(3 * thickness) text("Design", size=7, font="CutOutsFLF:style=Bold");
//    translate([length/2, (monitor_width + 2 * thickness) / 2, monitor_height - thickness]) metric_thread(inner_radius, 1.5, height, internal=true);
    }
    translate([length/2, (monitor_width + 2 * thickness) / 2, monitor_height]) metric_thread(inner_radius, 1.5, height);
