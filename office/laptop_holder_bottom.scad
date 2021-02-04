laptop_thickness = 25; //22;

height = 20;
length = 20;

thickness = 2;

screw_top = 9;
screw_bottom = 6;

screw_driver_diameter = 10;

with_bottom = true;

bottom = with_bottom ? thickness : 0;

$fn = 180;

difference() {
    // body
    cube([length + thickness, laptop_thickness + 2 * thickness, height + bottom]);
    
    // inner part
    translate([thickness, thickness, bottom]) cube([length, laptop_thickness, height]);
    
    // screw hole
    translate([thickness + length / 2, laptop_thickness + 2 * thickness, bottom + height / 2]) rotate([90, 0, 0]) cylinder(d1=5, d2=8, thickness);
    
    // screw driver hole
    translate([thickness + length / 2, 1.5 * thickness, bottom + height / 2]) rotate([90, 0, 0]) cylinder(d=screw_driver_diameter, 2 * thickness);
}

