radius = 80;
scale = 1.5;
thickness = 3;

handle_connect_length = 40;
handle_length = 100;
handle_width = 10;

translate([0, 0, handle_width])
rotate([-41, 0, 0]) {
    rotate([45, 0, 0]) {
        translate([0, -10, 0]) difference() {
            scale([1, scale, 1]) cylinder(r=radius, thickness);
            rotate([0, 0, 10]) translate([-2 * radius, 0, 0]) cube([4 * radius, 2 * scale * radius, thickness]);
        }
        translate([radius + 5, -0, 0]) rotate([0, -90, 10]) cylinder(r=handle_width, 2 * radius + 5);
    }
    
    translate([2 * radius - radius, 0, 0]) rotate([0, 90, 0]) cylinder(r=handle_width, handle_connect_length);
    translate([2 * radius + -radius + handle_connect_length, 0]) rotate([90, 0, 0]) cylinder(r=handle_width, handle_length);
    translate([2 * radius + -radius + handle_connect_length, 0]) sphere(handle_width);
}