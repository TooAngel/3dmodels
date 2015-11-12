radius = 40;
thickness = 2;
height = 20;
length = 40;

difference() {
	cylinder(height, r=radius);
	cylinder(height, r=radius - thickness);
	translate([-radius, 0, 0]) cube([2 * radius, 2 * radius, height]);
}


translate([radius - thickness, 0, 0]) cube([thickness, length, height]);