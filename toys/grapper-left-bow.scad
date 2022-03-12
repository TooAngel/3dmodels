height = 3;
diameter = 80;
width = 100;

hole = 6;

module outter() {
    difference() {
        cube([width+20, width+20, height+2]);
        translate([width/2, width/2, -1]) cylinder(d=width, height+2);
        translate([50, 0, -1]) cube([width, width, height+2]);
        translate([-1, -50, -1]) cube([width, width, height+2]);
    }
}

module item() {
    cube([width / 2 + 1, 6, height]);
    translate([0, 6, 0]) {
        difference() {
            cube([width, width, height]);
            translate([width/2, width/2, -1]) cylinder(d=diameter, height+2);
            translate([51, -1, -1]) cube([width, width, height+2]);
            translate([0, -1, -1]) outter();
        }
        difference() {
            translate([50, 88.7, 0]) cube([30, 10, height]);
            translate([50, 37.5, -1]) rotate([0, 0, 17]) cube([50, 50, height + 2]);
        }
    }
}
difference() {
    item();
    translate([7, 7, -1]) cylinder(d=hole, height+2);
    translate([45, 7, -1]) cylinder(d=hole, height+2);  
}