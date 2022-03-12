// hole distance 32
// hole m3
// border distance 21

width = 60;
length_holder = 25;
length = 90;
thickness = 5;

diameter_screw = 3.2;
border_distance = 21;
hole_distance = 32;

height = 40;

$fn = 180;

metal_height = 2;
metal_length = 20;

difference() {
    cube([width, length_holder, thickness]);
    translate([border_distance, length_holder / 2, 0]) cylinder(d=3.2, thickness);
    
    translate([border_distance + hole_distance, length_holder / 2, 0]) cylinder(d=3.2, thickness);
    
    translate([border_distance + hole_distance / 2 - metal_length / 2, 0, 0]) cube([metal_length, length_holder, metal_height]);
}


translate([0, -length + length_holder, 0]) cube([thickness, length, height]);

