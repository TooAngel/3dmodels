width = 69;
depth = 62;
height = 2;

connect_hole_width = 3;
connect_hole_depth = 10;
connect_hole_width_offset = 2;
connect_hole_depth_offset = 3;

side_width = 2;
side_depth = 71;
side_height = 9;
side_hole_diameter = 4;

holder_width = 5;
holder_diameter = 3.5;
holder_depth_offset = 12;

$fn=120;

difference() {
    cube([width, depth, height]);
    translate([connect_hole_width_offset, depth - connect_hole_depth - connect_hole_depth_offset, -1]) cube([connect_hole_width, connect_hole_depth, height + 2]);
    translate([width - connect_hole_width - connect_hole_width_offset, depth - connect_hole_depth - connect_hole_depth_offset, -1]) cube([connect_hole_width, connect_hole_depth, height + 2]);
}

difference() {
    translate([0, depth - side_depth, 0]) cube([side_width, side_depth, side_height]);
    translate([-1, -6, side_height / 2]) rotate([0, 90, 0]) cylinder(d=side_hole_diameter, side_width + 2);
}
translate([-holder_width, depth - holder_depth_offset, side_height / 2]) rotate([0, 90, 0]) cylinder(d=holder_diameter, holder_width);

translate([width, 0, 0]) difference() {
    translate([0, depth - side_depth, 0]) cube([side_width, side_depth, side_height]);
    translate([-1, -6, side_height / 2]) rotate([0, 90, 0]) cylinder(d=side_hole_diameter, side_width + 2);
}
translate([width + holder_width + 2, 0, 0]) translate([-holder_width, depth - holder_depth_offset, side_height / 2]) rotate([0, 90, 0]) cylinder(d=holder_diameter, holder_width);
