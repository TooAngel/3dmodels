radius = 40;
thickness = 2;
height = 20;
length = 40;

difference() {
	cylinder(height, r=radius, $fa=1);
	cylinder(height, r=radius - thickness, $fa=1);
	translate([-radius, 0, 0]) cube([2 * radius, 2 * radius, height]);
}

translate([-radius + thickness / 2, 0, 0]) cylinder(height, r=2);

difference() {
    translate([radius - thickness, 0, 0]) cube([thickness, length, height]);
    translate([radius, length - 5, height / 2]) rotate([90, 0,  -90]) linear_extrude(3 * thickness) text("TooAngel", size=4, font="CutOutsFLF:style=Regular");
    translate([radius, length - 10, height / 2 - 5]) rotate([90, 0,  -90]) linear_extrude(3 * thickness) text("Design", size=4, font="CutOutsFLF:style=Regular");
}
 