width = 53;
height = 10;
thickness = 4;

diameter = 6;
pinHeight = 14;

distanceBetweenPin = 34 + 2 * diameter / 2;

module pin() {
    cylinder(r=diameter/2, pinHeight);
} 

rotate([90, 0, 0]) {
    difference() {
        cube([width, height, thickness]);
        translate([width / 2, height / 2, 0]) cylinder(r1=2, r2=4, thickness + 2);
    }
    translate([(width - distanceBetweenPin) / 2, height / 2, 0]) pin();
    translate([(width - distanceBetweenPin) / 2 + distanceBetweenPin, height / 2, 0]) pin();
}