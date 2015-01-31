rotate(90) {
difference() {
	cube([50, 130, 10]);
	translate([25,130,0]) {cylinder(10, r=7);}
}

translate([-25,0,0]) {
	cube([100, 10, 50]);

	for ( i = [0 : 3] ) {
		translate([i*25,0,50]) {
			cube([12,5,10]);
			translate([12.5,5,0]) {cube([12,5,10]);}
		}
	}
}
}