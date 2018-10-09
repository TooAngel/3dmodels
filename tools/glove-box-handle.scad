width = 55;
length = 25;
thickness = 3;

angleZOffset = 3;

connectorLength = 1.5;
connectorRadius = 1.5;
connectorTopDistance = -1;

inletXOffset = 44;
inletYOffset = -4;
inletWidth = 7;
inletLength = 4;
inletThickness = 30;
inletPresser = 10;

topRadius = 4;

$fn=50;

translate([0, 0, topRadius]) rotate([90, 0, 0]) {
    cube([width, length, thickness]);

    hull() {
        translate([topRadius, 0, 0]) cylinder(r=topRadius, thickness);
        translate([width - topRadius, 0, 0]) cylinder(r=topRadius, thickness);
    }

    difference() {
        translate([0, 0, connectorRadius + angleZOffset - 0.5]) minkowski() {
            translate([0, -1, 0]); cube([width - 1, 1, 1]);
            rotate([0, 90, 0]) cylinder(r=connectorRadius, h=1);
        }
        translate([5, -5, 0]) cube([35, 10, 10]);
    }
    translate([-connectorLength, connectorRadius + connectorTopDistance, connectorRadius + angleZOffset]) rotate([0, 90, 0]) cylinder(r=connectorRadius, connectorLength);
    translate([width, connectorRadius + connectorTopDistance, connectorRadius + angleZOffset]) rotate([0, 90, 0]) cylinder(r=connectorRadius, connectorLength);

    translate([inletXOffset, inletYOffset, angleZOffset]) cube([inletWidth, inletLength, inletThickness]);
    translate([inletXOffset, inletYOffset + inletLength, angleZOffset + inletThickness - inletPresser]) cube([inletWidth, inletLength, inletPresser]);
}