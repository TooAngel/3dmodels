width = 200;
length = 200;
thickness = 2;
height = 50;

cube([width, length, thickness]);


cube([thickness, length, height]);
translate([width, 0, 0]) cube([thickness, length, height]);
