inner_diameter = 24;
holder_height = 23;

connector_length = 29;

mic_open_offset = 40;

holder_diff = 4;

hole_ring_height = 6;
hole_ring_thickness = 2;
hole_diameter = 8.5;

thickness = 3;

edge_rounding = 1;

$fn = 60;

minkowski() {
    translate([thickness/2, -1, edge_rounding/2 - 0.1]) difference() {
        outter_diameter = inner_diameter + 2 * thickness + holder_diff;
        cylinder(d1=inner_diameter + 2 * thickness, d2=outter_diameter, holder_height);
        translate([0, 0, -1]) cylinder(d1=inner_diameter, d2=inner_diameter + holder_diff, holder_height + 2);
        translate([-outter_diameter / 2, -mic_open_offset, -1]) cube([outter_diameter, outter_diameter, holder_height + 2]);
    }
    sphere(d=edge_rounding);
}
module holder() {
    translate([0, (inner_diameter + holder_diff) / 2, 0]) cube([thickness, connector_length - holder_height/2, holder_height]);
    translate([0, (inner_diameter + holder_diff) /2 + connector_length - holder_height/2, holder_height/2]) rotate([0, 90, 0]) cylinder(d=holder_height, thickness);
    translate([0, (inner_diameter + holder_diff) /2 + connector_length - holder_height/2, holder_height/2]) rotate([0, 90, 0]) cylinder(d=hole_diameter + 2 * hole_ring_thickness, hole_ring_height);
}

difference() {
    holder();
    translate([-1, (inner_diameter + holder_diff) / 2 + connector_length - holder_height/2, holder_height / 2]) rotate([0, 90, 0]) cylinder(d=hole_diameter, hole_ring_height + 2);
}
