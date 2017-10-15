height = 2;
thickness = 3;
hook_radius = 7.5;
length = 30;

module bow() {
	difference() {
		rotate_extrude()
		translate([hook_radius, 0, 0])
		circle(r = thickness/2, $fn=100);
		translate([-20, -20, -thickness/2]) {cube([20, 40, thickness+height]);}
		
	}
}

translate([length, 2 * hook_radius, 0]) {
       bow();
}

rotate([0, 180, 0]) bow();

translate([0, hook_radius, 0]) rotate([0, 90, 0]) cylinder(r=0.5 * thickness, length, $fn=100);