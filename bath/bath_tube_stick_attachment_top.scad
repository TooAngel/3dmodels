radius=8;
length_overlap=2;
width_overlap=4;
height=10;
top_offset=1;
heel=1;


translate([2 * radius, 3 * radius + (2 * width_overlap), 0]) {
	difference() {
		cube([2 * radius + length_overlap + 2 * top_offset, 2 * radius + width_overlap + 2 * top_offset, height + top_offset]);
		translate([radius + top_offset + length_overlap/2, radius + top_offset + width_overlap/2, 0]) {cylinder(height + top_offset, r=radius);}
		translate([0, top_offset + width_overlap/2, 0]) {cube([radius + top_offset + length_overlap/2, 2 * radius, height + top_offset]);}
		translate([top_offset, top_offset, top_offset]) {cube([radius + length_overlap, 2 * radius + width_overlap, height]);}


		translate([0, top_offset + heel, top_offset]) {cube([top_offset, 2 * radius + width_overlap - 2 * heel, height]);}
	}
}