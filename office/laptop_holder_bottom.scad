laptop_thickness = 22;

height = 20;
length = 20;

thickness = 2;

screw_top = 9;
screw_bottom = 6;

screw_driver_diameter = 10;

with_bottom = false;
bottom = 0;
if (with_bottom) {
    bottom = thickness;
}


$fn = 180;

difference() {
    cube([length + thickness, laptop_thickness + 2 * thickness, height + bottom]);
    translate([thickness, thickness, bottom]) cube([length, laptop_thickness, height]);
    translate([thickness + length / 2, laptop_thickness + 2 * thickness, bottom + height / 2]) rotate([90, 0, 0]) cylinder(d1=5, d2=8, thickness);
    translate([thickness + length / 2, thickness, bottom + height / 2]) rotate([90, 0, 0]) cylinder(d=screw_driver_diameter, thickness);
}

