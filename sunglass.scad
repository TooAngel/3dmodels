holder_height = 2;
holder_radius = 2.5;
holder_hole_radius = 1.2;
holder_length = 9;

rest_height = 4;
rest_length = 100;

rest_outter_radius = 150;
rest_inner_radius = 200;
rest_length = 140;

rest_thickness = 10;

// holder
translate([-holder_length, 0, 0])  {
    difference() {
        cylinder(holder_height, r=holder_radius);
        cylinder(holder_height, r=holder_hole_radius);
    }

    difference() {
        translate([0, -holder_radius, 0]) cube([holder_length, 2 * holder_radius,       holder_height]);
        cylinder(holder_height, r=holder_hole_radius);
    }
}

// rest
module drawBehindEarThingy() {
    translate([0, rest_outter_radius - holder_radius, 0]) difference() {
        translate([0, - rest_thickness + 2 * holder_radius, 0]) cylinder(rest_height, r=rest_outter_radius, $fa=2);
     translate([0, (2 * holder_radius) + rest_inner_radius - rest_outter_radius, 0]) cylinder(rest_height, r=rest_inner_radius, $fa=2);
        translate([-2 * rest_outter_radius, -rest_outter_radius - rest_thickness, 0]) cube([2*rest_outter_radius, 2 * rest_outter_radius, rest_height]);   
    }
}

$fn=60;
minkowski()
{
    drawBehindEarThingy();
    sphere(2.25);
}
    



    