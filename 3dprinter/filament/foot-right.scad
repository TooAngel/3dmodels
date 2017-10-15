thickness = 5;
foot_width = 100;
foot_length = 40;
connector_offset = 0.5;
connector_length = 10;
hole_opener_height = 5;

rotate(90) {
difference() {
	cube([50, 150, thickness]);
	translate([25,130,0]) {cylinder(thickness, r=7);}
	translate([30,130-(hole_opener_height/2),0]) {cube([20, hole_opener_height, thickness]);}
}

translate([-25,0,0]) {
	cube([foot_width, thickness, foot_length]);

	for ( i = [0 : 3] ) {
		translate([i*25,0,foot_length]) {
			translate([connector_offset,0,0]) {cube([foot_width / 8 - (2 * connector_offset),thickness/2 - connector_offset,connector_length]);}
			translate([foot_width / 8 + connector_offset,thickness/2+connector_offset,0]) {cube([foot_width / 8 - (2 * connector_offset),thickness/2 - connector_offset,connector_length]);}
		}
	}
}

difference() {
	translate([45,5,5]) {cube([5,20,10]);}
	for (i = [[45,15,10]]) {
		translate(i) {
			rotate([0,90]) {
				cylinder(thickness, r=2);
			}
		}
	}
}

difference() {
	translate([0,5,5]) {cube([5,20,10]);}
	for (i = [[0,15,10]]) {
		translate(i) {
			rotate([0,90]) {
				cylinder(thickness, r=2);
			}
		}
	}
}

}