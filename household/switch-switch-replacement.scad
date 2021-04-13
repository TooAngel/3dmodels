$fn = 100;

lower = 12.5;
upper = 10;
switch_height = 7;
distance = 8;

legs_height = 6;
legs_width = 3;
legs_depth = 3;

axis_diameter = 1.8;
axis_length = 16;

cylinder(d1=upper, d2=lower, switch_height);

translate([distance, 0, 0]) cylinder(d1=upper, d2=lower, switch_height);

translate([2.7, -legs_depth / 2 + 4, 0]) cube([legs_width, legs_depth, switch_height + legs_height]);
translate([2.7, -legs_depth / 2 - 4, 0]) cube([legs_width, legs_depth, switch_height + legs_height]);

translate([4.1, axis_length/2, switch_height]) rotate([90, 0, 0]) cylinder(d=axis_diameter, axis_length);