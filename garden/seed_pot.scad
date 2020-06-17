length = 30;
thickness = 1;
height = 20;


difference() {
    cube([length, length, height]);
    translate([thickness, thickness, thickness]) cube([length - 2 * thickness, length - 2 * thickness, height - thickness]);
}

translate([length, 0, 0]) difference() {
    cube([length, length, height]);
    translate([thickness, thickness, thickness]) cube([length - 2 * thickness, length - 2 * thickness, height - thickness]);
}