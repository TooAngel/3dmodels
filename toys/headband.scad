diameter = 130;
height = 20;
thickness = 1.5;
ear_length = 40;

end_diameter = 9;
end_rotate_offset_x = 8.5;
end_rotate_offset_y = 1;

$fn=120;

module ear() {
    cube([thickness, ear_length, height]);
}

module headband() {
    difference() {
        cylinder(d=diameter, height);
        translate([0, 0, -1]) cylinder(d=diameter - 2 * thickness, height + 2);
        translate([-(diameter + 2) / 2, 0, -1]) cube([diameter + 2, diameter + 2, height + 2]);
    }
    translate([-diameter/2, -0.8, 0]) rotate([0, 0, -10]) ear();
    translate([diameter/2 - thickness, -0.8, 0]) rotate([0, 0, 10]) ear();
}

difference() {
    headband();
    translate([-(diameter + 2) / 2, -(diameter + 2) / 2, height]) rotate([-6, 0, 0]) cube([diameter + 2, diameter + 2, height + 2]);
}

translate([diameter / 2 - end_rotate_offset_x, ear_length - end_rotate_offset_y, end_diameter / 2]) rotate([0, 90, 10]) cylinder(thickness, d=end_diameter);
translate([-diameter / 2 + end_rotate_offset_x - thickness, ear_length - end_rotate_offset_y, end_diameter / 2]) rotate([0, 90, -10]) cylinder(thickness, d=end_diameter);