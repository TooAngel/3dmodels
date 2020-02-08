diameter = 23;
holder_length = 30;
thickness = 3;
screw_diameter = 4;
screw_diameter_big = 9;

difference() {
    cylinder(r=diameter/2 + thickness,  thickness);
    translate([0, 7, 0]) cylinder(r1=screw_diameter/2, r2=screw_diameter_big/2, thickness);
    translate([0, -5, 0]) cylinder(r1=screw_diameter/2, r2=screw_diameter_big/2, thickness);
}

translate([0, 0, thickness]) difference() {
    cylinder(r=diameter/2 + thickness,  holder_length);
    cylinder(r=diameter/2,  holder_length);
    translate([-diameter/2, 0, 0]) cube([diameter, diameter, holder_length]);
}
