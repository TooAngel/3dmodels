pinoepel = 8;
radius = 50;
thickness = 6;
pipe = 6;
pipe_height=10;
connector_thickness = 4;
connector_length = 10;
holes = radius - (1.5 * thickness);


// outter pipe
difference() {
	cylinder(pipe_height, r=radius);
	cylinder(pipe_height, r=radius-thickness);
	rotate(22.5) {translate([-radius, -radius,0])cube([radius,2*radius,50]);}
translate([radius/2 - pipe_height,radius-12,pipe_height/2]) {rotate([0,90,0]) {cylinder(25, r=pipe_height/2);}}
}

// inner pipe
difference() {
	cylinder(pipe_height, r=radius - (thickness + pipe));
	cylinder(pipe_height, r=radius - (2 * thickness + pipe));
	rotate(22.5) {translate([-radius, -radius,0])cube([radius,2*radius,50]);}
}

translate([0,0,pipe_height]) {
difference() {
	cylinder(10, r1=radius, r2=radius-thickness);
	cylinder(10, r1=radius-thickness, r2=radius-(2 * thickness));
	for (z = [0:pinoepel/2]) {
		translate([sin(z * 360/pinoepel)*holes, cos(z * 360/pinoepel)*holes, 0]) {
				cylinder(10, r=2);
		}
	}
	rotate(22.5) {translate([-radius, -radius,0])cube([radius,2*radius,50]);}
}

translate([0,0,8]) {
	difference() {
		cylinder(2, r=radius-thickness);
		cylinder(2, r=radius-(2*thickness));
		for (z = [0:pinoepel/2]) {
			translate([sin(z * 360/pinoepel)*holes, cos(z * 360/pinoepel)*holes, 0]){
				cylinder(2, r=2);
			}
		}
		rotate(22.5) {translate([-radius, -radius,0])cube([radius,2*radius,50]);}
	}
}

for (z = [0:pinoepel/2-1]) {
	translate([sin(z * 360/pinoepel)*holes, cos(z * 360/pinoepel)*holes, 10]) {
		difference() {
			cylinder(15, r=3);
			cylinder(15, r=2);
		}
	}
}

difference() {
	cylinder(10, r1=radius-(thickness + pipe), r2=radius-(1 * thickness));
	cylinder(10, r1=radius-(2 * thickness + pipe), r2=radius-(2 * thickness));
	for (z = [0:pinoepel/2]) {
		translate([sin(z * 360/pinoepel)*holes, cos(z * 360/pinoepel)*holes, 0]) {
				cylinder(10, r=2);
		}
	}
	rotate(22.5) {translate([-radius, -radius,0])cube([radius,2*radius,50]);}
}
}

// connector
// outter pipe
difference() {
	cylinder(pipe_height, r=radius + connector_thickness);
	cylinder(pipe_height, r=radius);
	rotate(22.5) {translate([-radius-connector_length, -radius-connector_thickness,0])cube([radius + connector_thickness,2*(radius+connector_thickness),50]);}
      rotate(22.5) {translate([connector_length, -radius-connector_thickness,0])cube([radius + connector_thickness,2*(radius + connector_thickness),50]);}
	rotate(22.5) {translate([-radius,0,0]) cube([2*(radius+connector_thickness), radius+connector_thickness,50]);}
}

// inner pipe
difference() {
	cylinder(pipe_height, r=radius - (2 * thickness + pipe));
	cylinder(pipe_height, r=radius - (2 * thickness + pipe) - connector_thickness);
	rotate(22.5) {translate([-radius-connector_length, -radius-connector_thickness,0])cube([radius + connector_thickness,2*(radius+connector_thickness),50]);}
      rotate(22.5) {translate([connector_length, -radius-connector_thickness,0])cube([radius + connector_thickness,2*(radius + connector_thickness),50]);}
	rotate(22.5) {translate([-radius,0,0]) cube([2*(radius+connector_thickness), radius+connector_thickness,50]);}
}

translate([0,0,pipe_height]) {
difference() {
	cylinder(10, r1=radius + connector_thickness, r2=radius-thickness + connector_thickness);
	cylinder(10, r1=radius, r2=radius-thickness);
	rotate(22.5) {translate([-radius-connector_length, -radius-connector_thickness,0])cube([radius + connector_thickness,2*(radius+connector_thickness),50]);}
      rotate(22.5) {translate([connector_length, -radius-connector_thickness,0])cube([radius + connector_thickness,2*(radius + connector_thickness),50]);}
	rotate(22.5) {translate([-radius,0,0]) cube([2*(radius+connector_thickness), radius+connector_thickness,50]);}
}
difference() {
	cylinder(10, r1=radius-(2 * thickness + pipe), r2=radius-(2 * thickness));
	cylinder(10, r1=radius-(2 * thickness + pipe) - connector_thickness, r2=radius-(2 * thickness) - connector_thickness);
	rotate(22.5) {translate([-radius-connector_length, -radius-connector_thickness,0])cube([radius + connector_thickness,2*(radius+connector_thickness),50]);}
      rotate(22.5) {translate([connector_length, -radius-connector_thickness,0])cube([radius + connector_thickness,2*(radius + connector_thickness),50]);}
	rotate(22.5) {translate([-radius,0,0]) cube([2*(radius+connector_thickness), radius+connector_thickness,50]);}
}
}