diameter = 30; //28;
thickness = 2;
length_outter = 140;
length_inner = 40;
overlap = 10;

knob_diameter = 8; //6;
knob_distance = 14;

rotate([90, 0, 0]) {
    difference() {
        cylinder(r=diameter/2+thickness, length_outter);
        cylinder(r=diameter/2, length_outter);
        translate([0, diameter/2 + thickness, knob_distance]) rotate([90, 0, 0]) cylinder(r=knob_diameter/2, 2 * thickness);
        translate([0, -(diameter/2) + thickness, knob_distance]) rotate([90, 0, 0]) cylinder(r=knob_diameter/2, 2 * thickness);
    }


    translate([0, 0, length_outter - overlap]) difference() {
        cylinder(r=diameter/2, length_inner + overlap);
        cylinder(r=diameter/2 - thickness, length_inner + overlap);
    }
}