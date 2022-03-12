size = 16;
radius = 2;

dotRadius = 1;

$fn=120;

module shape() {
    minkowski() {
        cube([size - radius, size - radius, size - radius]);
        sphere(radius);
    }
}

module star() {
    // 14
    linear_extrude(height = 2) {
        polygon(points=[
            [0, 0],
            [2, 5],
            [7, 7],
            [3, 9],
            [4, 14],
            [0, 10],
            [-4, 14],
            [-3, 9],
            [-7, 7],
            [-2, 5],
        ]);
    }
}
//star();

module dice() {
    difference() {
        shape();
        
        // 6
        translate([1 * size / 4 - dotRadius, 1.5 * size / 4 - dotRadius, size]) sphere(dotRadius);
        translate([2 * size / 4 - dotRadius, 1.5 * size / 4 - dotRadius, size]) sphere(dotRadius);
        translate([3 * size / 4 - dotRadius, 1.5 * size / 4 - dotRadius, size]) sphere(dotRadius);
        translate([1 * size / 4 - dotRadius, 2.5 * size / 4 - dotRadius, size]) sphere(dotRadius);
        translate([2 * size / 4 - dotRadius, 2.5 * size / 4 - dotRadius, size]) sphere(dotRadius);
        translate([3 * size / 4 - dotRadius, 2.5 * size / 4 - dotRadius, size]) sphere(dotRadius);
        
        // 5
        translate([-radius, size / 2 - dotRadius, size / 2 - dotRadius]) sphere(dotRadius);
        translate([-radius, size / 4 - dotRadius, size / 4 - dotRadius]) sphere(dotRadius);
        translate([-radius, 3 * size / 4 - dotRadius, size / 4 - dotRadius]) sphere(dotRadius);
        translate([-radius, size / 4 - dotRadius, 3 * size / 4 - dotRadius]) sphere(dotRadius);
        translate([-radius, 3 * size / 4 - dotRadius, 3 * size / 4 - dotRadius]) sphere(dotRadius);
        
        // 4
        translate([size / 4 - dotRadius, -radius, size / 4 - dotRadius]) sphere(dotRadius);
        translate([3 * size / 4 - dotRadius, -radius, size / 4 - dotRadius]) sphere(dotRadius);
        translate([size / 4 - dotRadius, -radius, 3 * size / 4 - dotRadius]) sphere(dotRadius);
        translate([3 * size / 4 - dotRadius, -radius, 3 * size / 4 - dotRadius]) sphere(dotRadius);
        
        // 3
        translate([size / 4 - dotRadius, size, size / 4 - dotRadius]) sphere(dotRadius);
        translate([2 * size / 4 - dotRadius, size, 2 * size / 4 - dotRadius]) sphere(dotRadius);
        translate([3 * size / 4 - dotRadius, size, 3 * size / 4 - dotRadius]) sphere(dotRadius);
        
        // 2
        translate([size, size / 4 - dotRadius, size / 4 - dotRadius]) sphere(dotRadius);
        translate([size, 3 * size / 4 - dotRadius, 3 * size / 4 - dotRadius]) sphere(dotRadius);
        
        translate([7, 0, -3]) star();
        
    }
}
dice();