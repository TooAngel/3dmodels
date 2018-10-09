width = 35;
length = 11;
height = 15;
band_height = 9;
thickness = 3;
clip_width = 5;
holder_length = 18;
holder_handle = 16;

clip_band_hole_width = 6;

// body
difference() {
    cube([width, length, height]);
    translate([thickness, thickness, 0]) cube([width - 2 * thickness, length - 2 * thickness, height]);
    translate([thickness, length - thickness, 0]) cube([width - 2 * thickness - clip_width, length - 2 * thickness, height]);
}

// handle
translate([0, 0, 0]) cube([thickness, holder_length, height]);
translate([-8, holder_length + 3, 0]) rotate([0, 0, -20]) cube([holder_handle, thickness, height]);

// clip band hole
translate([width, 0, 0]) difference() {
    cube([clip_band_hole_width, thickness, height]);
    translate([0, 0, thickness]) cube([clip_band_hole_width - thickness, thickness, band_height]);
}

// other band hole
translate([30, -clip_band_hole_width, 0]) difference() {
    cube([thickness, clip_band_hole_width, height]);
    translate([0, thickness, thickness]) cube([thickness, clip_band_hole_width - thickness, band_height]);
}
