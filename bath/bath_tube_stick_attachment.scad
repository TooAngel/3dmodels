radius=8;
length_overlap=2;
width_overlap=4;
height=10;
top_offset=1;
heel=1;

difference() {
	cube([3 * radius + length_overlap, 2 * radius + width_overlap, height]);
	translate([3 * radius, radius + (width_overlap / 2), 0]) {cylinder(height, r=radius);}
	translate([2 * radius, 0, 0]) { cube([heel, top_offset, height]);}
	translate([2 * radius, 2 * radius + width_overlap - heel, 0]) { cube([heel, top_offset, height]);}
}


translate([2 * radius, 3 * radius + (2 * width_overlap), 0]) {
	difference() {
		cube([2 * radius + length_overlap + 2 * top_offset, 2 * radius + width_overlap + 2 * top_offset, height + top_offset]);
		translate([radius + top_offset + length_overlap/2, radius + top_offset + width_overlap/2, 0]) {cylinder(height + top_offset, r=radius);}
		translate([top_offset, top_offset, top_offset]) {cube([radius + length_overlap, 2 * radius + width_overlap, height]);}


		translate([0, top_offset + heel, top_offset]) {cube([top_offset, 2 * radius + width_overlap - 2 * heel, height]);}
	}
}