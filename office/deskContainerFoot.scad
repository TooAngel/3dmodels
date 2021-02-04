diameter_bottom = 18.5;
height_bottom = 10;

diameter_top = 8;
height_top = 6;

height_reduce = 2;

diameter_hole = 6;

$fn = 200;

module outter() {
    cylinder(d=diameter_bottom, height_bottom);
    translate([0, 0, height_bottom]) cylinder(d=diameter_top, height_top);
    translate([0, 0, height_bottom + height_top]) cylinder(d1=diameter_top, d2=diameter_hole, height_reduce);
}

difference() {
    outter();
    cylinder(d=diameter_hole, height_bottom + height_top + height_reduce);
}