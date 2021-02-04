use <../roundedcube.scad>;

width = 98.5;
length = 69;
height = 25;

thickness = 1;

holder_width = 18.5;
holder_open_width = 13;

holder_length = 4;
holder_x_offset = 11;
holder_x_offset_second = width - holder_width - holder_x_offset;

lock_outter = 20;
lock_inner = 13;

corner_radius = 5;
        
module box() {
    difference() {
        roundedcube([width, length, height], false, corner_radius, "z");
        translate([thickness, thickness, thickness]) roundedcube([width - 2 * thickness, length - 2 * thickness,   height - thickness], false, corner_radius, "z");
        translate([holder_x_offset, 0, thickness]) cube([holder_width, holder_length, height]);
        translate([holder_x_offset_second, 0, thickness]) cube([holder_width, holder_length, height]);
    }
}

module holder() {
    difference() {
        cube([holder_width, holder_length, height - thickness]); 
        translate([thickness, thickness, 0]) cube([holder_width - 2 * thickness, holder_length - 2 * thickness, height]);
        translate([(holder_width - holder_open_width) / 2, 0, 0]) cube([holder_open_width, thickness, height]);
    }
}


module lock() {
    difference() {
        cylinder(d=lock_outter, thickness);
        cylinder(d=lock_inner, thickness);
        translate([-lock_outter / 2, -lock_outter, 0]) cube([lock_outter, lock_outter, thickness]);
    }
}

box();
translate([holder_x_offset, 0, thickness]) holder();
translate([holder_x_offset_second, 0, thickness]) holder();
translate([width / 2, length, height - thickness]) lock();