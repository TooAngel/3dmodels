$fn = 180;

diameter = 27;
height = 5.25;
thickness = 16;
holeRadius = 3.5;

translate([0, 0, -height - 3]) rotate([0, -90, 0]) difference() {
    translate([3, 0, 0])  cylinder(r=diameter/2, thickness);
    translate([-diameter/2 - height, -diameter/2, -1]) cube([diameter, diameter, thickness + 2]);
    translate([height, 0, thickness/2]) rotate([0, 90, 0]) cylinder(r=holeRadius, 3 * height);    
}
