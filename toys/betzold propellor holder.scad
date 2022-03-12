$fn=180;

diameter_outter = 6;
diameter_inner = 2;
height = 5;

length = 3;
depth = 2;
holder_height = 2;

difference() {
    cylinder(d=diameter_outter, height);
    cylinder(d=diameter_inner, height);
}

difference() {
    translate([0, 0, height-1]) sphere(d=diameter_outter);
    cylinder(d=diameter_outter, height);
}


translate([diameter_outter / 2 - 2, -depth/2, height - holder_height]) cube([length + 2, depth, holder_height]);
rotate([0, 0, 120]) translate([diameter_outter / 2 - 2, -depth/2, height - holder_height]) cube([length + 2, depth, holder_height]);
rotate([0, 0, 240]) translate([diameter_outter / 2 - 2, -depth/2, height - holder_height]) cube([length + 2, depth, holder_height]);