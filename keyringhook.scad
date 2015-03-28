height = 2;
thickness = 4;
small_ring_radius = 5;
hook_radius = 10;
length = 30;


translate([0,0,thickness/2])
rotate_extrude()
translate([small_ring_radius, 0, 0])
circle(r = thickness/2, $fn=100);


translate([length, 0, 0]) {
	difference() {
		translate([0,0,thickness/2])
		rotate_extrude()
		translate([hook_radius, 0, 0])
		circle(r = thickness/2, $fn=100);
		translate([-20, -20, 0]) {cube([20, 40, thickness+height]);}
		translate([-5, -7, thickness/2]) {
			rotate([0, 90, -3]) {
				cylinder(10, r=thickness/2);
			}
		}

	}
}


translate([4, 4-thickness, thickness/2]) {
	rotate([0, 90, 21]) {
		cylinder(length-1, r=thickness/2, $fn=100);
	}
}

translate([4, -(4-thickness), thickness/2]) {
	rotate([0, 90, -33]) {
		cylinder(length+2, r=thickness/2, $fn=100);
	}
}

