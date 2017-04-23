diameter = 55;
height = 19;

difference() {
    cylinder(height, r=diameter/2, $fa=1);
    cylinder(height, r=diameter/2 -1, $fa=1);
    translate([-6,0,0]) cube([12, diameter,height]);
}

translate([-4,diameter/2-1,0])
difference() {
    cylinder(height,  r=2.5);
    cylinder(height, r=1.5);
}


translate([8.5,2.5,0])
difference() {
    cylinder(height,  r=2.5, $fa=1);
    cylinder(height, r=1.5, $fa=1);
}
translate([5, diameter/2 - 1,0]) cylinder(height,  r=1.5);

difference() {
    cube([8.5, 5, height]);
    translate([2, 2.5, 0]) cylinder(height,  r=1.9, $fa=1);
    translate([0, 2, 0]) cube([1, 1.3, height]);
    translate([8.5,2.5,0]) cylinder(height, r=1.5, $fa=1);
}