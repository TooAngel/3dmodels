rotate([0,-90,0]) {
	difference() {
		cube([20,10,5]);
		translate([15, 5, 0]) {cylinder(5, r=3);}
	}

	cube([2, 10, 40]);
}