module edge() {
    translate([0, 0, sin(45) * 30]) rotate([-45, 0, 0]) rotate([0, 90, 0]) difference() {
        minkowski() {
            cube([30, 30, 10]);
            sphere(1, $fn=60);
         }
        translate([1, 1, 1]) cube([30, 30, 8]);
        rotate([0, 0, 45]) translate([sin(45) * 30, -30, -5]) cube([60, 60, 20]);
    }
}

module edgeSphere() {
    difference() {
        translate([0, 0, 15]) sphere(15);
        translate([0, -4, 25]) rotate([-90, 0, 0]) rotate([0, 0, 45]) cube([30, 30, 8]);
    }
}

//edge();
translate([0, 0, 30])rotate([0, 180, 0]) edgeSphere();