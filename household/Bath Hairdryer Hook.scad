width = 29;
thickness = 2;
length = 10;

difference() {
    cube([width + 2 * thickness, width + 2 * thickness, length]);
    translate([thickness, thickness, 0]) cube([width, width, length]);
    translate([thickness, 0, 0]) cube([width- thickness, thickness, length]);
}

translate([-length - thickness, 0, 0]) cube([length + thickness, thickness, length]);
translate([-length - thickness, 0, 0]) cube([thickness, length + thickness, length]);