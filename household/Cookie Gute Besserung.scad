size = 23;
thickness = 3;
font_thickness = 6;

translate([0, 0, 8]) rotate([180, 0, 0]) {
    translate([-12, 2, 2]) linear_extrude(font_thickness) text("Gute", size=8, font="CutOutsFLF:style=Bold");
    translate([-17, -6, 2]) linear_extrude(font_thickness) text("Besserung", size=5, font="CutOutsFLF:style=Bold");

    difference() {
        cylinder(5, r=size);
        translate([0, 0, -1]) cylinder(7, r=size - thickness);
    }

    translate([0, 0, 5]) cylinder(3, r=size);
}