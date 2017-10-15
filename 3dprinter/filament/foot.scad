thickness = 5;

rotate(90) {
difference() {
	cube([50, 150, thickness]);
	translate([25,130,0]) {cylinder(thickness, r=7);}
}

translate([-25,0,0]) {
	cube([100, thickness, 50]);

	for ( i = [0 : 3] ) {
		translate([i*25,0,50]) {
			cube([12,thickness/2,10]);
			translate([12.5,thickness/2,0]) {cube([12,thickness/2,10]);}
		}
	}
}

difference() {
	translate([0,5,5]) {cube([5,20,10]);}
	for (i = [[0,10,10], [0,20,10]]) {
		translate(i) {
			rotate([0,90]) {
				cylinder(thickness, r=2);
			}
		}
	}
}
}