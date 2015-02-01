include <../threads.scad>

// PLA: 19
inner_radius = 19;
// PLA: 6
inner_depth = 6;
outter_radius = inner_radius + 7;
outter_depth = 6;
hole_radius = 3;
thread_depth = 3;


difference() {
	cylinder(outter_depth, r=outter_radius);
	cylinder(outter_depth, r=hole_radius);
}

translate([0,0,outter_depth]) {
	difference() {
		cylinder(inner_depth, r=inner_radius);
		cylinder(inner_depth, r=hole_radius);
	}
}

translate([0,0,outter_depth + inner_depth]) {
	difference() {
		metric_thread(2 * inner_radius + 3, 3, thread_depth);
		cylinder(20, r=hole_radius);
	}
}
