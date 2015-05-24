distance = 190;
thickness = 8;
diameter = 8;

outter_diameter = diameter + 2 * thickness;

difference() {
    cube([distance, thickness, thickness]);
    translate([1.2 * thickness, 1, 1]) rotate([90, 0, 0]) linear_extrude(thickness) text("TooAngel Design", size=4, font="Deftone Stylus:style=Regular");
}
translate([-diameter/2, thickness/2, 0]) {
    difference() {
        cylinder(thickness, r=outter_diameter/2);
        cylinder(thickness, r=diameter/2);
        translate([-outter_diameter, -outter_diameter/2, 0]) cube(outter_diameter, outter_diameter, thickness);
    }
    
}

translate([distance + diameter/2, thickness/2, 0]) {
    difference() {
        cylinder(thickness, r=outter_diameter/2);
        cylinder(thickness, r=diameter/2);
        translate([0, -outter_diameter/2, 0]) cube(outter_diameter, outter_diameter, thickness);
    }
}