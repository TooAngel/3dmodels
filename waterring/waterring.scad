pinoepel = 8;
radius = 50;
thickness = 5;
holes = radius - (1.5 * thickness);

difference() {
	cylinder(5, r=radius);
	cylinder(5, r=radius-thickness);
}

difference() {
	cylinder(5, r=radius - (2 * thickness));
	cylinder(5, r=radius - (3 * thickness));
}

translate([0,0,5]) {
difference() {
	cylinder(10, r1=radius, r2=radius-thickness);
	cylinder(10, r1=radius-thickness, r2=radius-(2 * thickness));
	for (z = [0:pinoepel]) {
		translate([sin(z * 360/pinoepel)*holes, cos(z * 360/pinoepel)*holes, 0]) {
				cylinder(10, r=2);
		}
	}
}

translate([0,0,8]) {
	difference() {
		cylinder(2, r=radius-thickness);
		cylinder(2, r=radius-(2*thickness));
		for (z = [0:pinoepel]) {
			translate([sin(z * 360/pinoepel)*holes, cos(z * 360/pinoepel)*holes, 0]){
				cylinder(2, r=2);
			}
		}
	}
}

for (z = [0:pinoepel]) {
	translate([sin(z * 360/pinoepel)*holes, cos(z * 360/pinoepel)*holes, 10]) {
		difference() {
			cylinder(15, r=3);
			cylinder(15, r=2);
		}
	}
}

difference() {
	cylinder(10, r1=radius-(2 * thickness), r2=radius-(1 * thickness));
	cylinder(10, r1=radius-(3 * thickness), r2=radius-(2 * thickness));
	for (z = [0:pinoepel]) {
		translate([sin(z * 360/pinoepel)*holes, cos(z * 360/pinoepel)*holes, 0]) {
				cylinder(10, r=2);
		}
	}
}
}