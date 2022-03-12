length = 174; // 177 - thickness
width = 25;
height = 12; // 15 - thickness
distance = 9;

thickness = 3;

hole_first = 55;
hole_second = 156;
hole_outter = 10;
hole_inner = 5;

$fn = 120;

module skelleton() {
    cube([length, thickness, height]);
    translate([0, distance, 0]) cube([length, thickness, height]);
    translate([0, 2 * distance, 0]) cube([length, thickness, height]);
    
    translate([0, 0, height]) cube([length + thickness, 2 * distance + thickness, thickness]);
    translate([length, 0, 0]) cube([thickness, 2 * distance + thickness, height]);
    
    translate([hole_first - thickness / 2, 0, 0]) cube([thickness, 2 * distance, height]);
    translate([hole_first, distance + thickness / 2, 0]) cylinder(d=hole_outter, height);
    
    translate([hole_second - thickness / 2, 0, 0]) cube([thickness, 2 * distance, height]);
    translate([hole_second, distance + thickness / 2, 0]) cylinder(d=hole_outter, height);
}

module arm() {
    translate([0, -distance - thickness/2, 0]) {
        difference() {
            skelleton();
            translate([hole_first, distance + thickness / 2, -1]) cylinder(d=hole_inner, height + 2 + thickness);
            translate([hole_first, distance + thickness / 2, height + 1]) cylinder(d=hole_outter, height + 2 + thickness);
            
            translate([hole_second, distance + thickness / 2, -1]) cylinder(d=hole_inner, height + 2 + thickness);
            translate([hole_second, distance + thickness / 2, height + 1]) cylinder(d=hole_outter, height + 2 + thickness);
        }
    }
}

arm();
rotate([0, -90, 180]) arm();