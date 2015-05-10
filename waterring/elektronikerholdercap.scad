thickness=2;
//arduino_length + 2 * thickness + offset(2)
length=72 + 2 * 2 + 2;
//arduion_width + motor_width + 3 * thickness + offset(2)
width=54 + 45 + 3 * 2 + 2;
height=10;

cable_hole_width=16;
tube_diameter=7;

difference() {
    cube([length + 2 * thickness, width + 2 * thickness, height + thickness]);
    translate([thickness, thickness, thickness]) cube([length, width, height]);
    translate([length + thickness - thickness/2, 2 * thickness + cable_hole_width, tube_diameter]) rotate([0, 90, 0]) cylinder(2 * thickness, r=tube_diameter/2);        
    translate([length + thickness - thickness/2, 2 * thickness + cable_hole_width - tube_diameter/2, tube_diameter]) cube([2 * thickness, tube_diameter, tube_diameter]);
}
