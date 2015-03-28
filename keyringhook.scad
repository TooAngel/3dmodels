height = 2;
thickness = 2;
small_ring_radius = 10;
hook_radius = 15;

translate([0,0,thickness/2])
rotate_extrude()
translate([small_ring_radius, 0, 0])
circle(r = thickness/2);


translate([30, 0, 0]) {
	difference() {
		translate([0,0,thickness/2])
		rotate_extrude()
		translate([hook_radius, 0, 0])
		circle(r = thickness/2);
		translate([-20, -20, 0]) {cube([20, 40, height]);}
		translate([-7, -13, thickness/2]) {
			rotate([0, 90, -3]) {
				cylinder(10, r=thickness/2);
			}
		}
	}
}
translate([8, 6-thickness, thickness/2]) {
	rotate([0, 90, 26]) {
		cylinder(25, r=thickness/2);
	}
}

translate([8, -(6-thickness), thickness/2]) {
	rotate([0, 90, -33]) {
		cylinder(26, r=thickness/2);
	}
}

