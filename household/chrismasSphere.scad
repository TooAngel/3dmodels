
diameter = 80;

difference() {
    sphere(r=diameter / 2);
    translate([-37, diameter/2 + 5, -7.5]) rotate([90, 0, 0]) linear_extrude(height = diameter + 10) text(text = "Wilken", font = "CutOutsFLF:style=Regular", size = 16);
}

translate([0, 0, diameter / 2]) rotate([90, 0, 0])  difference() {
    cylinder(r=5, 3);
    translate([0.5, 0.5, 0]) cylinder(r=4, 3);
    
}