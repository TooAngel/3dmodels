cube([25, 40, 2]);
difference() {
    translate([12.5, 20.96, 1]) rotate([70, 0, 0]) cylinder(r=2, 15);
    translate([0, 0, -10]) cube([25, 40, 10]);    
}

translate([50, 0, 0]) {
cube([25, 40, 2]);
difference() {
    translate([12.5, 20.96, 1]) rotate([70, 0, 0]) cylinder(r=2, 15);
    translate([0, 0, -10]) cube([25, 40, 10]);    
}
}