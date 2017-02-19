diameter = 55;
height = 19;

difference() {
    cylinder(height, r=diameter/2);
    cylinder(height, r=diameter/2 -1);
    translate([-6,-diameter,0]) cube([12, 2*diameter,height]);
}

translate([-4,diameter/2-1,0])
difference() {
    cylinder(height,  r=2.5);
    cylinder(height, r=1.5);
}
translate([-5, -diameter/2+1,0]) cylinder(height,  r=1.5);

translate([4,diameter/2-1,0])
difference() {
    cylinder(height,  r=2.5);
    cylinder(height, r=1.5);
}
translate([5, -diameter/2+1,0]) cylinder(height,  r=1.5);

difference() {
    cube([10, 5, height]);
    translate([2, 2.5, 0]) cylinder(height,  r=1.9);
    translate([0, 2, 0]) cube([1, 1.3, height]);
    translate([8, 2.5, 0]) cylinder(height,  r=1.9);    
    translate([9, 2, 0]) cube([1, 1.3, height]);
}