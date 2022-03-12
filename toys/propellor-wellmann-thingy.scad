ring_outter_diameter = 82;
ring_thickness = 2;
ring_height = 6;

middle_outter_diameter = 12;
middle_thickness = 2;
middle_height = 9;
middle_cap_thickness = -2;
middle_spare_width = 4;
middle_spare_height = 2;

wing_width = 11;
wing_height = 1;

$fn = 120;

module ring() {
    difference() {
        cylinder(d=ring_outter_diameter, ring_height);
        translate([0, 0, -1]) cylinder(d=ring_outter_diameter - 2 * ring_thickness, ring_height + 2);
    }
}

module middle() {
    difference() {
        cylinder(d=middle_outter_diameter, middle_height);
        translate([0, 0, middle_cap_thickness]) cylinder(d=middle_outter_diameter - 2 * middle_thickness, middle_height);
        
        for (i = [0:1:3]) {
        rotate([0, 0, i * 120]) translate([-middle_spare_width / 2, middle_outter_diameter / 2 - middle_thickness - 3, -1]) cube([middle_spare_width, 3 * middle_thickness, middle_spare_height + 1]);
        }
        
    }
}

module wing() {
    difference() {
        rotate([0, 20, 0]) translate([-wing_width/2 - 1.2, middle_outter_diameter/2 - 2.9, ring_height-3.1]) cube([wing_width, ring_outter_diameter/2 - middle_outter_diameter/2 + 1, wing_height]);
        translate([0, 0, middle_cap_thickness]) cylinder(d=middle_outter_diameter - 2 * middle_thickness, middle_height);
    }
}

ring();
middle();
for (i = [0:1:3]) {
    rotate([0, 0, i * 120]) wing();
}