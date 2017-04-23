holder_height = 2;
holder_radius = 2.5;
holder_hole_radius = 1.2;
holder_length = 9;

minsky_sphere = 1;
rest_height = 4 - (2 * minsky_sphere);
rest_length = 100;

rest_outter_radius = 150;
rest_inner_radius = 200;
rest_length = 140;

rest_thickness = 10;

side = -1; // Left: 1, Right: -1
ankle = 20;

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
    difference() {
        translate([0, side * (rest_outter_radius - rest_thickness + holder_radius + minsky_sphere), 0]) cylinder(rest_height, r=rest_outter_radius, $fa=2);
        
        translate([0, side * (rest_inner_radius + holder_radius - minsky_sphere), 0]) cylinder(rest_height, r=rest_inner_radius, $fa=2);
        
        rotate([0, 0, side * ankle]) translate([-2 * rest_inner_radius, -rest_outter_radius - rest_thickness - tan(ankle) * (2 * rest_outter_radius - minsky_sphere) , -minsky_sphere]) cube([2*rest_inner_radius, 2 * rest_outter_radius, rest_height + (2 * minsky_sphere)]);
    }
}

   

$fn=60;
minkowski() {
    drawBehindEarThingy();
    sphere(minsky_sphere);
}
    



    