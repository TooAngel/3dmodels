inner_diameter = 8;
height = 4;
otter_diameter = 22;

$fn=120;

difference() {
    cylinder(d=inner_diameter, height);
    cylinder(d=inner_diameter-2, height);
}
translate([0, 0, height]) cylinder(d=otter_diameter, 1);