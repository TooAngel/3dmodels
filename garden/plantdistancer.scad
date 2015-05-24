distance = 190;
thickness = 8;
diameter = 8;

outter_diameter = diameter + 2 * thickness;

cube([distance, thickness, thickness]);

translate([-outter_diameter/2, thickness/2, 0]) {
    difference() {
        cylinder(thickness, r=outter_diameter/2);
        cylinder(thickness, r=diameter/2);
        translate([-outter_diameter, -outter_diameter/2, 0]) cube(outter_diameter, outter_diameter, thickness);
    }
}

translate([distance + outter_diameter/2, thickness/2, 0]) {
    difference() {
        cylinder(thickness, r=outter_diameter/2);
        cylinder(thickness, r=diameter/2);
        translate([0, -outter_diameter/2, 0]) cube(outter_diameter, outter_diameter, thickness);
    }
}