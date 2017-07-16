// main
length = 27;
height = 10;
// I think this should be 16, but the lowest layer is a bit thicker
middle_hole_length = 17;
// I think this should be 4, but the lowest layer is a bit thicker
middle_hole_height = 5;
middle_top_rounding_radius = 60;

difference() {
    cube([length,  height, 10]);
    // middle hole
     translate([(length - middle_hole_length) / 2, height - middle_hole_height, 0]) cube([middle_hole_length, middle_hole_height, 10]);
    // finger hole
    translate([length / 2, 2, - 6]) rotate([90, 0, 0]) cylinder(2, r=10);
}

// top
difference() {
    translate([length / 2, - middle_top_rounding_radius + height + 2, 0]) cylinder(10, r=middle_top_rounding_radius, $fn=100);
    translate([length / 2 - middle_top_rounding_radius, - 2 * middle_top_rounding_radius + height, 0]) cube([2 * middle_top_rounding_radius, 2 * middle_top_rounding_radius, 10]);
}
 
// Sides
sides_width=2;
sides_height=2;
sides_hole_height = 4;

side_length = sqrt(pow(height, 2) / 2);

//right
//translate([length, 0, 0]) cube([sides_width, sides_height, 10]);

difference() {
    translate([length, 0, 0]) rotate([0, 0, 45]) cube([side_length, side_length, 10]);
    translate([length, sides_height, 0]) cube([2 * side_length, sides_hole_height, 10]);
}

//left
translate([-sides_width, 0, 0]) cube([sides_width, sides_height, 10]);
translate([-2, sides_hole_height + sides_height, 0]) cube([2, 4, 10]);