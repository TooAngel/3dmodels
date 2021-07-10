$fn = 100;

slide_base_width = 10;
slide_base_depth = 20;
slide_base_height = 2;

slide_front_depth = 5;

top_width = 7;
top_depth = 19;
top_height = 5;


hole_length = 10;
hole_diameter = 5;
hole_height_offset = 1;

module base() {
    cube([slide_base_width, slide_base_depth, slide_base_height]);
    translate([(slide_base_width - top_width) / 2, 0, slide_base_height]) cube([top_width, top_depth, top_height]);
    difference() {
        translate([0, slide_base_depth, 0]) cube([slide_base_width, slide_front_depth, slide_base_height]);
        rotate([20, 0, 0]) translate([0, slide_base_depth, -slide_base_height-7.3]) cube([slide_base_width, slide_front_depth, slide_base_height]);
    }
    
}

difference() {
    base();
    translate([slide_base_width/2, 0, hole_height_offset + hole_diameter/2]) rotate([-90, 0, 0]) cylinder(d=hole_diameter, hole_length);
    translate([slide_base_width/2, hole_length + top_width / 2, hole_height_offset + hole_diameter/2]) cylinder(d=top_width - 1, top_height);
}