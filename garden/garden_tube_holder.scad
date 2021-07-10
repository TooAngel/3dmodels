$fn = 180;

tube_diameter = 19;
tube_holder_height = 20;
tube_holder_thickness = 3;
tube_holder_y_offset = 5;

stick_length = 100;
stick_diameter = 12;

rotate([-90, 0, 0]) difference() {
    cylinder(d=tube_diameter + 2 * tube_holder_thickness, tube_holder_height);
    cylinder(d=tube_diameter, tube_holder_height);
    translate([-(tube_diameter + 2 * tube_holder_thickness) / 2, tube_holder_y_offset, 0]) cube([tube_diameter + 2 * tube_holder_thickness, tube_diameter + 2 * tube_holder_thickness, tube_holder_height]);
}

translate([0, tube_holder_height / 2, (tube_diameter + 2 * tube_holder_thickness) / 2]) cylinder(d1=stick_diameter, d2=3, stick_length);
    