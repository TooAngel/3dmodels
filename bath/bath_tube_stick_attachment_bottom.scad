radius=11;
height=30;

top_border=2;
heel_width=3;
heel_height=3;

holder_length = 160;
holder_width = 100;
border = 4;
bottom_thickness=6;

rows = 8;
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

translate([-60,20,0]) {
rotate([0,0,-90]) {
difference() {
	cube([2 * radius, 2 * radius + 2 * heel_height, height]);
	translate([2 * radius, radius + heel_height, 0]) {cylinder(height, r=radius);}
	translate([1 * radius - heel_width, 0, 0]) { cube([heel_width, heel_height, height]);}
	translate([1 * radius - heel_width, 2 * radius + heel_height, 0]) { cube([heel_width, heel_height, height]);}
}

translate([-holder_length - 2 * border + holder_width/rows, -holder_width/2 + (2 * radius + 2 * heel_height)/2 - 2 * border + holder_width/rows, 0]) {
	difference() {
		minkowski() {
			cube([holder_length + 2 * border - (2 * holder_width/rows), holder_width + 2 * border - (2 * holder_width/rows), height-1]);
			cylinder(1, r=holder_width/rows);
		}
		translate([border, border, bottom_thickness]) {
			minkowski() {
				cube([holder_length - (2 * holder_width/rows), holder_width - (2 * holder_width/rows), height-1]);
				cylinder(1, r=holder_width/rows);
			}
		}
		for (row = [1: rows]) {
			for (column = [1: columns]) {
				translate([border + row * holder_length / rows - (holder_length / (2 * rows)) - holder_width/rows, border + column * holder_width / columns - (holder_width / (2 * columns)) - holder_width/rows, 0]) {cylinder(bottom_thickness, r1=2, r2=holder_width/rows);}
			}
		}
	}
}
}
}