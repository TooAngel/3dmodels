inner = 30;
outter = 32;

inner_height = 20;
between = 10;
overlapp = 2;
outter_height = 20;

thickness = 3;

pinoepel_width = 5;
pinoepel_length = 1;

module parts() {
    difference() {
        cylinder(d=inner, inner_height);
        cylinder(d=inner - thickness, inner_height);
        translate([-pinoepel_width/2, (inner - thickness)/2, 0]) cube([pinoepel_width, pinoepel_length, inner_height]);
    }


    rotate([5, 0, 0]) translate([0, 0, inner_height - overlapp]) difference() {
        cylinder(d=outter + thickness, between);
        cylinder(d=inner - thickness, between);
    }

    rotate([10, 0, 0]) {
        translate([0, 0, inner_height + between - 2 * overlapp]) difference() {
            cylinder(d=outter + thickness, outter_height);
            cylinder(d=outter, outter_height);
        }
        translate([-pinoepel_width/2, (outter - thickness)/ 2, inner_height + between - 2 * overlapp]) cube([pinoepel_width, pinoepel_length, outter_height]);
    }
}

module bendPipe() {
    $fn=128;
    bend_radius = 1;
    angle_1 = 0;
    angle_2 = 30;

    union() {
        // lower arm
        rotate([0, 0, angle_1])
        translate([bend_radius + inner, 0.02, 0])
        rotate([90, 0, 0])
        difference() {
            cylinder(d=inner, h=inner_height);
            cylinder(d=inner - 2 * thickness, h=inner_height);
            translate([(inner - 2 * thickness)/2 + pinoepel_length, -(pinoepel_width + 1)/2, 0]) cube([2 * pinoepel_length, pinoepel_width + 1, inner_height]); // Looks good, but not yet understood
        }

        // upper arm
        rotate([0, 0, angle_2])
        translate([bend_radius + inner, -0.02, 0])
        rotate([-90, 0, 0])
        difference() {
            cylinder(d1=inner, d2=outter + 2 * thickness, h=outter_height);
            cylinder(d1=inner - 2 * thickness, d2=outter, h=outter_height);
        }
        
        rotate([0, 0, angle_2])
        translate([bend_radius + inner, -0.02 + outter_height, 0])
        rotate([-90, 0, 0])
        difference() {
            cylinder(d=outter + 2 * thickness, h=outter_height);
            cylinder(d=outter, h=outter_height);
        }
        
        // Looks good, but not yet understood
        rotate([0, 0, angle_2])
        translate([bend_radius + 1.5 * inner - pinoepel_length, -0.02 + outter_height, pinoepel_width/2])
        rotate([-90, 0, 0])
        cube([2 * pinoepel_length, pinoepel_width, outter_height]);

        // bend
        difference() {
            // torus
            rotate_extrude()
            translate([bend_radius + inner, 0, 0])
            circle(d=inner);
    
            // torus cutout
            rotate_extrude()
            translate([bend_radius + inner, 0, 0])
            circle(d=inner - 2 * thickness);
    
            // lower cutout
            rotate([0, 0, angle_1])
            translate([-50 * (((angle_2 - angle_1) <= 180)?1:0), -100, -50])
            cube([100, 100, 100]);

            // upper cutout
            rotate([0, 0, angle_2])
            translate([-50 * (((angle_2 - angle_1) <= 180)?1:0), 0, -50])
            cube([100, 100, 100]);
        }
    }
}

rotate([-90, 60, 0]) bendPipe();
