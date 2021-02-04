trailer_connect_diameter = 4;
trailer_connect_height = 7;

car_connect_axis_diameter = 4;
car_connect_axis_height = 3;

car_connect_holder_width = 2.5;
car_connect_holder_length = 9; // 11;1

car_connect_holder_height = 2;

stick_width = 4;
stick_length = 30;
stick_height = 3;

$fn = 100;

translate([stick_width / 2, car_connect_axis_diameter / 2, stick_height]) {
    translate([-car_connect_holder_width / 2, -car_connect_holder_length / 2, car_connect_axis_height]) cube([car_connect_holder_width, car_connect_holder_length, car_connect_holder_height]);
    cylinder(d=car_connect_axis_diameter, car_connect_axis_height);
}

cube([stick_width, stick_length, stick_height]);

translate([trailer_connect_diameter/ 2, stick_length - trailer_connect_diameter / 2, stick_height]) cylinder(d=trailer_connect_diameter, trailer_connect_height);