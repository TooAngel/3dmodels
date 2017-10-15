arduino_length=72;
arduino_width=54;
thickness=2;

cube([arduino_length + 2 * thickness, arduino_width + 2 * thickness, thickness]);
difference() {
    translate([1 * thickness, 1 * thickness, thickness]) cube([arduino_length- 0 * thickness, arduino_width-0 * thickness, 2 * thickness]);
translate([2 * thickness, 2 * thickness, thickness]) cube([arduino_length-2 * thickness, arduino_width-2 * thickness, 2 * thickness]);
}