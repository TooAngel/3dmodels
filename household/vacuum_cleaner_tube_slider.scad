$fn = 100;


width = 48;
depth = 18;
height = 20;

rotate_y_long = -20;
rotate_y_short_cylinder = -50;
rotate_y_short_cube = 50;

top_width = 35;
top_depth = 8;
top_height = 8;

tube_diameter = 41;

hole_length = 11;
hole_diameter = 6;

difference() {
    cube([width, depth, height]);
    translate([0, depth/2 - top_depth / 2, 0]) cube([top_width, top_depth, top_height]);
    translate([0, depth / 2, -18]) rotate([0, 90, 0]) cylinder(d=tube_diameter, width);
    translate([0, 0, 2]) rotate([0, rotate_y_long, 0]) cube([2 * width, depth, height]);
    translate([width + 12, depth / 2, 2]) rotate([0, rotate_y_short_cylinder, 0]) cylinder(d=18, width);
    translate([width - 16, 0, height]) rotate([0, rotate_y_short_cube, 0]) cube([2 * width, depth, height]);
    translate([width - 18, depth/2, 1]) cylinder(d=hole_diameter, hole_length);
}