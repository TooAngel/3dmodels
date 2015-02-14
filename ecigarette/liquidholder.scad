hole_radius = 12;
hole_height = 18;
height = 20;
distance = 1;

holes_per_row = 4;

size = holes_per_row * (2 * hole_radius) + (holes_per_row + 1) * distance;

//size = 85;

difference() {
	cube([size,size,height]);
	translate([hole_radius + distance, hole_radius + distance, 0]) {
		for (i = [0 : holes_per_row - 1]) {
			for (j = [0 : holes_per_row - 1]) {
				translate([i * (2 * hole_radius + distance), j * (2 * hole_radius + distance), height - hole_height]) {cylinder(hole_height, r=hole_radius);}
			}
		}
	}
}
