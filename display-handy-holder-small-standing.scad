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
     translate([2 * thickness, 12, 10]) rotate([-90, 0,  90]) linear_extrude(3 * thickness) text("Reimers", size=7, font="CutOutsFLF:style=Bold");
    translate([2 * thickness, 18, 28]) rotate([-90, 0,  90]) linear_extrude(3 * thickness) text("regelt", size=7, font="CutOutsFLF:style=Bold");
    translate([monitor_width, length -12, 10]) rotate([-90, 0,  -90]) linear_extrude(3 * thickness) text("Reimers", size=7, font="CutOutsFLF:style=Bold");
    translate([monitor_width, length -18, 26]) rotate([-90, 0,  -90]) linear_extrude(3 * thickness) text("regelt", size=7, font="CutOutsFLF:style=Bold");
}
translate([0, 0, 15]) cube([monitor_width + 2 * thickness, length, thickness]);
}