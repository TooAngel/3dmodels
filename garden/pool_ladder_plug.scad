distance = 130; // Distance from the ladder pipe to the pool border
plate_diameter = 80; // Diameter of the plate at the pool border

inner_diameter = 43; //41; // Diameter of the ladder pipe, being exact didn't fit
pinoepel_width = 1;
pinoepel_length = 2;
thickness = 3; // Wall thickness

height_around = 30; //height around the pool pipe

// Part which is responsible for the distance
cylinder(r1=plate_diameter/2, r2=inner_diameter/2 + thickness, distance, $fn=360);

// Part which fits around the ladder pipe
translate([0, 0, distance]) difference() {
    cylinder(r=inner_diameter/2 + thickness, height_around, $fn=360);
    translate([0, 0, thickness]) cylinder(r=inner_diameter/2, height_around, $fn=360);
}

// Small cube around the round shape so that it is properly fixed with the ladder pipe
translate([inner_diameter/2 - pinoepel_width, -pinoepel_length/2, distance]) cube([pinoepel_width, pinoepel_length, height_around]);
rotate([0, 0, 90]) translate([inner_diameter/2 - pinoepel_width, -pinoepel_length/2, distance]) cube([pinoepel_width, pinoepel_length, height_around]);
rotate([0, 0, 180]) translate([inner_diameter/2 - pinoepel_width, -pinoepel_length/2, distance]) cube([pinoepel_width, pinoepel_length, height_around]);
rotate([0, 0, 270]) translate([inner_diameter/2 - pinoepel_width, -pinoepel_length/2, distance]) cube([pinoepel_width, pinoepel_length, height_around]);