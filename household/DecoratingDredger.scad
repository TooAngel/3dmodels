diameter = 40;
height_cap = 10;
thickness = 1;
height_body = 40;
agitator_diameter = 4;
handle_diameter = 10;
handle_height = 10;

full_body_height = height_cap - 2 * thickness + height_body + thickness;


// plate with holes
difference() {
    cylinder(r = diameter / 2, thickness);
    for (x=[-diameter/2 + 2 * thickness: 4: diameter/2 - 2 * thickness]) {
        for (y=[-diameter/2  + 2 * thickness: 4: diameter/2 - 2 * thickness]) {
             translate([x, y, 0]) cylinder(r = thickness, thickness);
        }
    }
}

// cap
difference () {
    // ring
    cylinder(r = diameter / 2, height_cap);
    cylinder(r = diameter / 2 - 1.5 * thickness, height_cap);
    
    translate([-diameter / 2 + 0.5 * thickness, 0, (height_cap - 2 * thickness) / 2]) cube([2 * thickness, 1.5 * thickness, (height_cap - 2 * thickness)]);
    translate([-diameter / 2 + 0.5 * thickness, -2 * thickness, (height_cap - 2 * thickness) / 2]) cube([2 * thickness, 2.5 * thickness, 1.5 * thickness]);
    
    translate([diameter / 2 - 2.5 * thickness, 0, (height_cap - 2 * thickness) / 2]) cube([2 * thickness, 1.5 * thickness,  (height_cap - 1.5 * thickness)]);
    translate([diameter / 2 - 2.5 * thickness, thickness, (height_cap - 2 * thickness) / 2]) cube([2 * thickness, 2.5 * thickness, 1.5 * thickness]);
}


// body
rotate([180, 0, 0]) translate([1.2 * diameter, 0, -full_body_height]) {
    difference () {
        cylinder(r = diameter / 2 - 2 * thickness, height_cap - 2 * thickness);
        cylinder(r = diameter / 2 - 3 * thickness, height_cap - 2 * thickness);
    }
    
    translate([0, 0, height_cap - 2 * thickness]) difference () {
        cylinder(r1 = diameter / 2 - 2 * thickness, r2 = diameter / 2, thickness);
        cylinder(r1 = diameter / 2 - 3 * thickness, r2 = diameter / 2 - thickness, thickness);
    }

    translate([0, 0, height_cap - 1 * thickness]) difference () {
        cylinder(r = diameter / 2, height_body);
        cylinder(r = diameter / 2 - thickness, height_body);
    }
    
    translate([0, 0, height_cap - 2 * thickness + height_body]) difference () {
        cylinder(r = diameter / 2, thickness);
        cylinder(r = agitator_diameter / 2 + thickness, thickness);
    }
    translate([-diameter / 2 + 2 * thickness - thickness, 0, (height_cap - 2 * thickness) / 2]) cube([thickness, thickness, thickness]);
    translate([diameter / 2 - 2 * thickness, 0, (height_cap - 2 * thickness) / 2]) cube([thickness, thickness, thickness]);
}


//  agitator
translate([1.2 * diameter, 0, 0]) {
    cylinder(r=agitator_diameter / 2, full_body_height);
    translate([-thickness / 2, -0.5 * (diameter - 7 * thickness), 0]) cube([thickness, diameter - 7 * thickness, thickness]);
}

// handle
translate([1.2 * diameter, 0, full_body_height]) {
    cylinder(r1=agitator_diameter / 2, r2=handle_diameter/2, handle_diameter - agitator_diameter);
}

// handle
translate([1.2 * diameter, 0, full_body_height + handle_diameter - agitator_diameter]) {
    cylinder(r=handle_diameter/2, handle_height);
}

