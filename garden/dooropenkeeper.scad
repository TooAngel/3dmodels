open = 70; //78;

length = 80;
thickness = 3;
height = 30;
radius = 10;

circleHole = 20;
holeHypothenusis = sqrt(pow(circleHole, 2) + pow(circleHole, 2));
holeConnectorRadius = 5;

// sin alpha = opposite / hyperthenuse
alpha = asin(open/2 / length);

// Flexible circle
difference() {
    cylinder(height, r=radius);
    cylinder(height, r=radius-thickness);
    translate([holeHypothenusis/2, -holeHypothenusis/2, 0]) rotate([0, 0, 45]) cube([circleHole, circleHole, height]);
}

translate([radius-1.63, radius-1.63, 0]) difference() {
    cylinder(height, r=holeConnectorRadius);
    cylinder(height, r=holeConnectorRadius-thickness);
    translate([holeHypothenusis/2, -holeHypothenusis/2, 0]) rotate([0, 0, 48]) cube([circleHole, circleHole, height]);
    translate([-holeHypothenusis/2, -holeHypothenusis/2, 0]) rotate([0, 0, 45]) cube([circleHole, circleHole, height]);
    translate([-circleHole/2, 0, 0]) cube([circleHole, circleHole, height]);
}


translate([radius-1.63, -radius+1.63, 0]) rotate([0, 0, 180]) difference() {
    cylinder(height, r=holeConnectorRadius);
    cylinder(height, r=holeConnectorRadius-thickness);
    translate([holeHypothenusis/2, -holeHypothenusis/2, 0]) rotate([0, 0, 45]) cube([circleHole, circleHole, height]);
    translate([-holeHypothenusis/2, -holeHypothenusis/2, 0]) rotate([0, 0, 42]) cube([circleHole, circleHole, height]);
    translate([-circleHole/2, 0, 0]) cube([circleHole, circleHole, height]);
}

translate([radius + 0.5, 4, 0]) rotate([0, 0, 35]) cube([length, thickness, height]);

translate([radius - 1 , -6.6, 0]) difference() {
    rotate([0, 0, -35]) cube([length, thickness, height]);
    translate([radius + 0.2 * thickness, -1 * thickness - 5, 2]) rotate([90, 0, -45]) linear_extrude(thickness) text("TooAngel Design", size=4, font="Deftone Stylus:style=Regular");
}
