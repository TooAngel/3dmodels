height = 2;
thickness = 3;
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
		translate([-5, -8, thickness/2]) {
			rotate([0, 90, 0]) {
				cylinder(10, r=thickness/2, $fn=100);
			}
		}

	}
}


translate([4, 4-thickness, thickness/2]) {
	rotate([0, 90, 18.8]) {
		cylinder(length-1.6, r=thickness/2, $fn=100);
	}
}

translate([4, -(4-thickness), thickness/2]) {
	rotate([0, 90, -26]) {
		cylinder(length+2, r=thickness/2, $fn=100);
	}
}

