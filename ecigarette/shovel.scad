frontRadius=20;
thickness=2;
frontLength=50;

backRadius=10;
backLength=50;

cutBottomPlate = 500;

difference() {
    rotate([100, 0, 0]) {
        difference() {
            cylinder(frontLength, r=frontRadius);
            translate([0, 0, thickness + 1]) cylinder(frontLength-thickness, r=frontRadius-thickness);
        }
    }
    translate([-cutBottomPlate / 2, -cutBottomPlate / 2, -cutBottomPlate]) cube(cutBottomPlate, cutBottomPlate, cutBottomPlate);
}

difference() {
    translate([0, backLength-thickness, backRadius-thickness]) rotate([90, 0, 0]) cylinder(backLength, r=backRadius);
    translate([-cutBottomPlate / 2, -cutBottomPlate / 2, -cutBottomPlate]) cube(cutBottomPlate, cutBottomPlate, cutBottomPlate);
    translate([2, 40, thickness]) rotate([0, 180,  90]) linear_extrude(thickness) text("TooAngel Design", size=4, font="Deftone Stylus:style=Regular");
}
