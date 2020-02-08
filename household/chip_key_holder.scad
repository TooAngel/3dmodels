lower_inner = 14;
thickness = 2;
height = 30;
key_inner = 7;
length = 30;

rotate([90, 0, 0]) difference() {
    cube([lower_inner + 2 * thickness, length, height]);
    translate([thickness, 0, 0]) cube([lower_inner, length, height / 2 - 0.5 * thickness]);
    translate([thickness, 0, height / 2 + 0.5 * thickness]) cube([key_inner, length, height / 2 - 0.5 * thickness]);
}