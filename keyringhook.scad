height = 2;
thickness = 2;
small_ring_radius = 5;
hook_radius = 10;
length = 20;


translate([0,0,thickness/2])
rotate_extrude()
translate([small_ring_radius, 0, 0])
circle(r = thickness/2);


translate([length, 0, 0]) {
	difference() {
		translate([0,0,thickness/2])
		rotate_extrude()
		translate([hook_radius, 0, 0])
		circle(r = thickness/2);
		translate([-20, -20, 0]) {cube([20, 40, height]);}
		translate([-7, -9, thickness/2]) {
			rotate([0, 90, -3]) {
				cylinder(10, r=thickness/2);
			}
		}

	}
}



translate([4, 4-thickness, thickness/2]) {
	rotate([0, 90, 26]) {
		cylinder(length-2, r=thickness/2);
	}
}

translate([4, -(4-thickness), thickness/2]) {
	rotate([0, 90, -33]) {
		cylinder(length, r=thickness/2);
	}
}

