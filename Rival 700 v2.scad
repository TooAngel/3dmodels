// main
difference() {
    cube([27,  10, 10]);
    // middle hole
     translate([5, 6, 0]) cube([17, 4, 10]);
    // finger hole
    translate([13.5, 2, - 6]) rotate([90, 0, 0]) cylinder(2, r=10);
}

// top
translate([4.5, 10, 0]) cube([18, 1, 10]);

//right
translate([27, 0, 0]) cube([3, 3, 10]);

//left
translate([-3, 0, 0]) cube([3, 3, 10]);