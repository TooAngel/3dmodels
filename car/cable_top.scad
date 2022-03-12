end_depth = 75;
middle_depth = 90;
middle_width = 30;

overlap = 6;

total_depth = 110;
total_width = 600;

// Calculation for side
depth_offset = total_depth-middle_depth;
width_offset = (total_width/2)-middle_width;
top_angle = atan(depth_offset / width_offset);

// Should be 200, adjusting for testing
part_width = 200;
part_depth = tan(top_angle) * (part_width - middle_width) + middle_depth;

// TODO check usage
thickness = 1;
border_height = 8;
border_thickness = 2;

screw_diameter = 3.5;

module side() {
    rounding = 4;
    
    translate([-overlap, -overlap, 0]) difference() {
        minkowski() {
            linear_extrude(height=thickness) {
                    polygon(points = [
                [0 + rounding, 0 + rounding],
                [0 + rounding, end_depth + 2 * overlap - rounding],
                [middle_width, middle_depth + 2 * overlap - rounding],
                [part_width + 2 * overlap - rounding, part_depth + 2 * overlap - rounding],
                [part_width + 2 * overlap - rounding, 0 + rounding]
                ]);
            }
            cylinder(r=rounding,h=thickness);
        }
        translate([overlap + part_width, 0, -1]) cube([2 * overlap, 2 * (end_depth + 2 * overlap), 2 * thickness + 2]);
    }


    translate([0, 0, thickness]) difference() {
        minkowski() {
            linear_extrude(height=border_height/2) {
                polygon(points = [
                    [0 + rounding, 0 + rounding],
                    [0 + rounding, end_depth - rounding],
                    [middle_width, middle_depth - rounding],
                    [part_width - rounding, part_depth - rounding],
                    [part_width - rounding, 0 + rounding]
                ]);
            }
            cylinder(r=rounding,h=border_height/2);
        }
        translate([0, 0, -1]) minkowski() {
            linear_extrude(height=border_height + 2) {
                polygon(points = [
                    [0 + rounding + border_thickness, 0 + rounding + border_thickness],
                    [0 + rounding + border_thickness, end_depth - rounding - border_thickness],
                    [middle_width, middle_depth - rounding - border_thickness],
                    [part_width - rounding - border_thickness, part_depth - rounding - border_thickness],
                    [part_width - rounding - border_thickness, 0 + rounding + border_thickness]
                ]);
            }
            cylinder(r=rounding,h=border_height);
        }
        translate([part_width - border_thickness - 1, part_depth / 4, thickness + border_height / 2]) rotate([0, 90, 0]) cylinder(d=screw_diameter, 2 * border_thickness);
        translate([part_width - border_thickness - 1, 3 * part_depth / 4, thickness + border_height / 2]) rotate([0, 90, 0]) cylinder(d=screw_diameter, 2 * border_thickness);
    }
}

module total() {
    rounding = 4;
    minkowski() {
        linear_extrude(height=border_height) {
                polygon(points = [
            [0 + rounding, 0 + rounding],
            [0 + rounding, end_depth - rounding],
            [middle_width, middle_depth - rounding],
            [total_width/2, total_depth - rounding],
            [total_width - middle_width, middle_depth - rounding],
            [total_width - rounding, end_depth - rounding],
            [total_width - rounding, 0 + rounding]
            ]);
        }
        cylinder(r=rounding,h=border_height);
    }
}

//color("red") total();
side();