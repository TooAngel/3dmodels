thickness=1;
width=20;
length=20;
height=9;
connector_hole_width=10;
sensor_height=3;
sensor_width=7;

difference() {
    cube([width + 2 * thickness, length + 2 * thickness, height + thickness]);
    translate([thickness, thickness, thickness]) cube([width, length, height]);
    translate([thickness + width / 2 - connector_hole_width / 2, 0, thickness]) cube([connector_hole_width, thickness, height]);
    translate([thickness, length + thickness, thickness]) cube([sensor_width, thickness, sensor_height]);
    translate([thickness + width - sensor_width, length + thickness, thickness]) cube([sensor_width, thickness, sensor_height]);
}