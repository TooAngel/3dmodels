$fn=180;

camera_diameter = 76;
camera_height = 5; //10;

camera_hole_diameter = 4;
camera_hole_from_border = 5.2;


holder_diameter = 50;
holder_height = 100;

difference() {
    cylinder(d=camera_diameter, camera_height);
    translate([camera_diameter / 2 - camera_hole_from_border, 0, 0]) cylinder(d=camera_hole_diameter, camera_height);
    rotate([0, 0, 120]) translate([camera_diameter / 2 - camera_hole_from_border, 0, 0]) cylinder(d=camera_hole_diameter, camera_height);
    rotate([0, 0, 240]) translate([camera_diameter / 2 - camera_hole_from_border, 0, 0]) cylinder(d=camera_hole_diameter, camera_height);
}

translate([0, 0, camera_height]) cylinder(d=holder_diameter, holder_height);