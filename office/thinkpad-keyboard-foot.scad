width=13.5;
length=20;
height=3;

pin_length=2;
pin_radius=1;

difference() {
    cube([width, length, height]);

    // flex holes
    translate([2, 0, 0]) cube([2, length-5, height]);
    translate([width - 4, 0, 0]) cube([2, length-5, height]);

    // slope
    translate([-1, length/2, length/2]) rotate([-45, 0, -5]) cube([width + 2, length, height]);
}


translate([-pin_length, pin_radius + 1, height/2]) rotate([0, 90, 0]) cylinder(r=pin_radius, pin_length);
translate([width, pin_radius + 1, height/2]) rotate([0, 90, 0]) cylinder(r=pin_radius, pin_length);