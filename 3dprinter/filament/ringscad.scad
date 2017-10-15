difference() {
	union() {
		cylinder(6, r=25);
		translate([0,0,6]) {
			cylinder(6, r=18);
		}
	}
	cylinder(12, r=3);
}