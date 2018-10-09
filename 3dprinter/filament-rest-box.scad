width = 50;
thickness = 1.2;
hole_width = width - 10;

distance = (width - hole_width) / 2;

difference() {
    cube(width, width, width);
    translate([thickness, thickness, thickness]) cube(width - (2 * thickness) , width - (2 * thickness), width - (2 * thickness));
    translate([distance, distance, width - thickness]) cube(hole_width , hole_width, thickness);
}