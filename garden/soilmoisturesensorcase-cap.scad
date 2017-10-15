thickness=1;
width=20;
length=20;
height=9;
connector_hole_width=10;
sensor_height=3;
sensor_width=7;


    cube([width + 2 * thickness, length + 2 * thickness, thickness]);
difference() {
    translate([thickness, thickness, thickness]) cube([width, length, thickness]);
    translate([2 * thickness, 2 * thickness, thickness]) cube([width - 2 * thickness, length - 2 * thickness, thickness]);
}