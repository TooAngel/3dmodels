radius=11;
height=10;

top_border=2;
heel_width=3;
heel_height=3;

difference() {
	cube([3 * radius, 2 * radius + 2 * heel_height, height]);
	translate([3 * radius, radius + heel_height, 0]) {cylinder(height, r=radius);}
	translate([2 * radius - heel_width, 0, 0]) { cube([heel_width, heel_height, height]);}
	translate([2 * radius - heel_width, 2 * radius + heel_height, 0]) { cube([heel_width, heel_height, height]);}
}


translate([2 * radius - heel_width, 3 * radius + (2 * heel_height), 0]) {
	difference() {
		cube([2 * radius + 2 * top_border + heel_width, 2 * radius + 2 * heel_height + 2 * top_border, height + top_border]);
		translate([radius + top_border + heel_width, radius + top_border + heel_height, 0]) {cylinder(height + top_border, r=radius);}
		translate([0, top_border + heel_height, 0]) {cube([radius + top_border + heel_width, 2 * radius, height + top_border]);}
		translate([heel_width, top_border, top_border]) {cube([radius + heel_width, 2 * radius + 2 * heel_height, height]);}
		translate([0, top_border + heel_height, top_border]) {cube([heel_width, 2 * radius - heel_height, height]);}
	}
}