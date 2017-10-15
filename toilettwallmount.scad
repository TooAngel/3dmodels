difference() {
    cube([33, 17, 7]);
    // Inner hole
    translate([0, 2, 0]) cube([20, 13, 3]);
    
    // Outter reduce
    translate([23, 0, 3]) cube([10, 17, 4]);
    translate([23, 0, 0]) cube([10, 1, 4]);
    translate([23, 16, 0]) cube([10, 1, 4]);
    
    
    // Screw hole
    translate([5, 8.5, 0]) cylinder(r=2.5, 7, $fn=20);
    translate([15, 8.5, 0]) cylinder(r=2.5, 7, $fn=20);
    translate([5, 6, 0]) cube([10, 5, 7]);
    translate([30, 0, 3]) rotate([0, 20, 0]) cube([10, 17, 10]);
}
