// hole distance 32
// hole m3
// border distance 21

width = 60;
length_holder = 25;
length = 70;
thickness = 5;

diameter_screw = 3.2;
border_distance = 21;
hole_distance = 32;

height = 40;

$fn = 180;

difference() {
    cube([width, length_holder, thickness]);
    translate([border_distance, length_holder / 2, 0]) cylinder(d=3.2, thickness);
    
    translate([border_distance + hole_distance, length_holder / 2, 0]) cylinder(d=3.2, thickness);
}


cube([thickness, length, height]);

