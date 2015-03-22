radius=9;
height=30;

top_border=2;
heel_width=3;
heel_height=3;

holder_length = 200;
holder_width = 100;
border = 2;
bottom_thickness=4;

rows = 10;
columns = 5;

translate([2 * radius - heel_width, 3 * radius + (2 * heel_height), 0]) {
	difference() {
		cube([2 * radius + 2 * top_border + heel_width, 2 * radius + 2 * heel_height + 2 * top_border, height + top_border]);
		translate([radius + top_border + heel_width, radius + top_border + heel_height, 0]) {cylinder(height + top_border, r=radius);}
		translate([0, top_border + heel_height, 0]) {cube([radius + top_border + heel_width, 2 * radius, height + top_border]);}
		translate([heel_width, top_border, top_border]) {cube([radius + heel_width, 2 * radius + 2 * heel_height, height]);}
		translate([0, top_border + heel_height, top_border]) {cube([heel_width, 2 * radius - heel_height, height]);}
	}
}