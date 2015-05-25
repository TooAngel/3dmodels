open = 70; //78;

length = 80;
thickness = 3;
height = 30;
radius = 10;

// sin alpha = opposite / hyperthenuse
alpha = asin(open/2 / length);

difference() {
    cylinder(height, r=radius);
    cylinder(height, r=radius-thickness);
    cube([length, thickness, height]);    
}
translate([radius-thickness, thickness, 0]) rotate([0, 0, alpha]) cube([length, thickness, height]);
difference() {
    translate([radius-thickness, -thickness, 0]) rotate([0, 0, -alpha]) cube([length, thickness, height]);
    translate([radius + 0.2 * thickness, -1 * thickness, 1]) rotate([90, 0, -alpha]) linear_extrude(thickness) text("TooAngel Design", size=4, font="Deftone Stylus:style=Regular");
}