inner_radius = 25;

difference() {
	union() {
		cylinder(6, r=inner_radius + 7);
		translate([0,0,6]) {
			cylinder(6, r=inner_radius);
		}
	}
	cylinder(12, r=3);
}