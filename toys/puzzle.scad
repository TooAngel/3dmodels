/*
 * Puzzle piece (C) by Tobias Wilken
 *
 * Printed in black and white can be used as chess board
 */

width= 50;
length = 50;
height = 1;

connector_diameter = 14;
offset =4.5;

minsky_sphere = 2;

module piece() {
    difference() {
        cube([width - (2 * minsky_sphere), length - (2 * minsky_sphere), height]);
        translate([offset - minsky_sphere, (length) / 2 - minsky_sphere, 0]) cylinder(height, r=connector_diameter / 2 + minsky_sphere);
        translate([width - minsky_sphere - offset, length / 2 - minsky_sphere, 0]) cylinder(height, r=connector_diameter / 2 + minsky_sphere);    
    }
    translate([width / 2 - minsky_sphere,  -minsky_sphere - offset, 0]) cylinder(height, r=connector_diameter / 2 - minsky_sphere);
    translate([width / 2- minsky_sphere, length - minsky_sphere + offset, 0]) cylinder(height, r=connector_diameter / 2 - minsky_sphere);
 }
 
 $fn=20;
minkowski() {
    piece();
    sphere(minsky_sphere);
}