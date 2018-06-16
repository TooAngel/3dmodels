include <../lib/threads.scad>
 
threadLength = 8;

cubeLength = 70;
cubeWidth = 70;

phoneThickness = 8;
thickness = 1.5;
overlapp = 1.5;

chargerHoleWidth = 20;

translate([0, 0, cubeLength / 2]) rotate([0, -90, 0]) {
    metric_thread (diameter=8, pitch=1, length=threadLength, internal=false);    

    difference() {
        translate([-(cubeLength + 2 * thickness) / 2, -(cubeWidth + 2 * thickness)/ 2, threadLength]) cube([cubeLength + 2 * thickness, cubeWidth + 2 * thickness, phoneThickness + 2 * thickness]);
        // Inlet
        translate([-cubeLength / 2, -cubeWidth / 2, threadLength + thickness]) cube([cubeLength + 2 * thickness, cubeWidth, phoneThickness]);
        
        // front
        translate([-(cubeLength - overlapp)/ 2, -(cubeWidth - overlapp)/ 2, threadLength + thickness + phoneThickness]) cube([cubeLength + 2 * thickness, cubeWidth - overlapp, phoneThickness]);

        // charger
        translate([-(cubeLength + 2 * thickness)/ 2, -chargerHoleWidth/ 2, threadLength + thickness]) cube([cubeLength + 2 * thickness, chargerHoleWidth - 1, phoneThickness + thickness]);
    }
}