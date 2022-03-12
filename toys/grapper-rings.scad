inner_diameter = 6;
outter_diameter = 11;

small_height = 3;
big_height = 6;

$fn = 180;

module ring(height) {
    difference() {
        cylinder(d=outter_diameter, height);
        translate([0, 0, -1]) cylinder(d=inner_diameter, height + 2);
    }
}

ring(small_height);

translate([2 * outter_diameter, 0, 0]) ring(big_height);