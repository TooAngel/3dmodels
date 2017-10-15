difference() {
 cylinder(1, r=45);
 translate([-30, 1, 0]) linear_extrude(1) text("FAIR", size=18, font="CutOutsFLF:style=Regular");
 translate([-26, - 22, 0])  linear_extrude(1) text("ECK", size=18, font="CutOutsFLF:style=Regular");
}

difference() {
translate([-10, -63, 0]) cube([20,  20, 1]);
translate([0, -63, 0]) cylinder(1, r=2);
}

difference() {
translate([0, -63, 0]) cylinder(1, r=10);
translate([0, -63, 0]) cylinder(1, r=2);
}
