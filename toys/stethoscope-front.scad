big_outter_diameter = 46;
thickness = 2;
height = 12;

$fn=120;

module tubeConnector() {
    small_diameter = 4;
    big_diameter = 9;
    small_height = 2;
    big_height = 12;
    
    cylinder(d=small_diameter, 2 * small_height);
    translate([0, 0, 2 * small_height]) cylinder(d=big_diameter, small_height);
    translate([0, 0, 3 * small_height]) cylinder(d=small_diameter, small_height);
    translate([0, 0, 4 * small_height]) cylinder(d=big_diameter, small_height);
    translate([0, 0, 5 * small_height]) cylinder(d=small_diameter, big_height);
    translate([0, 0, 5 * small_height + big_height]) sphere(d=small_diameter);
}


difference() {
    cylinder(d=big_outter_diameter, height);
    translate([0, 0, thickness]) cylinder(d=big_outter_diameter - 2 * thickness, height);
}


translate([-5, big_outter_diameter / 2 - 1, height / 2]) rotate([-90, 0, 0]) tubeConnector();
translate([5, big_outter_diameter / 2 - 1, height / 2]) rotate([-90, 0, 0]) tubeConnector();

