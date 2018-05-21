difference() {
 cylinder(1, r=45);
 translate([-30, -4.5, 0]) linear_extrude(1) text("Relocately", size=9, font="CutOutsFLF:style=Regular");
}

difference() {
translate([-10, -63, 0]) cube([20,  20, 1]);
translate([0, -63, 0]) cylinder(1, r=2);
}

difference() {
translate([0, -63, 0]) cylinder(1, r=10);
translate([0, -63, 0]) cylinder(1, r=2);
}
