cube([25, 40, 2]);
difference() {
    translate([12.5, 20.96, 0]) rotate([45, 0, 0]) cylinder(r=2, 15);
    translate([0, 0, -10]) cube([25, 40, 10]);    
}
