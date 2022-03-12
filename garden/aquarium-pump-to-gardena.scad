$fn=120;

plug_outter_diameter = 17;
plug_middle_diameter = 14;
plug_top_height = 12;

upper_inline_ring_diameter = 13;
upper_inline_ring_height = 4;

lower_diameter = 20;
lower_height = 7;

distancer_height = 5;

big_diameter = 30;
big_height = 8;

curving = 1;

plug_inner_diameter = 9;

connector_tube_outter_diameter = 10;
connector_tube_outter_height = 10;
connector_tube_inner_diameter = 6;
connector_tube_height = 10;
connector_tube_thickness = 1;

module torus(radius_big, radius_small) {
 translate_x = radius_big / 2 - radius_small / 2;
 radius = radius_small / 2;
 rotate_extrude(convexity=4) 
    translate([translate_x, 0, 0]) circle(r=radius);
}


module plug_outter() {
    cylinder(d=big_diameter, big_height);
    translate([0, 0, big_height]) cylinder(d1=lower_diameter, d2=plug_middle_diameter, lower_height);

    translate([0, 0, big_height + lower_height]) cylinder(d=plug_middle_diameter, distancer_height);

    translate([0, 0, big_height + lower_height + distancer_height]) translate([0, 0, curving]) minkowski() {
        cylinder(d1=plug_outter_diameter - 2 * curving, d2=8, 10);
        sphere(curving);
    }

    //translate([0, 0, big_height + lower_height + distancer_height + 7]) translate([0, 0, curving]) minkowski() {
      //  cylinder(d=plug_outter_diameter - 2 * curving, plug_top_height - 2 * curving - 8);
        //sphere(curving);
    //}
}

module plug() {
    difference() {
        plug_outter();
        cylinder(d=plug_inner_diameter, big_height + lower_height + distancer_height + plug_top_height);
        translate([0, 0, big_height + lower_height + distancer_height + plug_top_height - upper_inline_ring_height + 1]) torus(upper_inline_ring_diameter + 6, upper_inline_ring_height / 2);
    }
    
}

plug();
//translate([0, 0, big_height + lower_height + distancer_height + plug_top_height - upper_inline_ring_height]) torus(upper_inline_ring_diameter, upper_inline_ring_height / 2);

module tube() {
    // base plate
    difference() {
        cylinder(d=big_diameter, connector_tube_thickness);
        cylinder(d=connector_tube_inner_diameter - connector_tube_thickness, connector_tube_height);
    }
    
    // outter tube
    translate([0, 0, connector_tube_thickness]) difference() {
        cylinder(d1=big_diameter, d2=connector_tube_outter_diameter + connector_tube_thickness, connector_tube_outter_height);
        cylinder(d=connector_tube_outter_diameter, connector_tube_outter_height);
    }
    
    // inner tube
    //difference() {
      //  cylinder(d=connector_tube_inner_diameter, connector_tube_height);
        //cylinder(d=connector_tube_inner_diameter - connector_tube_thickness, connector_tube_height);
    //}
}

rotate([180, 0, 0]) tube();