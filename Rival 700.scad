height = 9;
hole_depth = 6;

difference() {
    cube([28, 11, height]);
    translate([6, 1, 0]) cube([17, 5, hole_depth]);
    translate([0, 5, 0]) cube([4, 4, hole_depth]);
    translate([25, 5, 0]) cube([4, 4, hole_depth]);
    translate ([14.5, 12, 0]) cylinder(hole_depth, r=5);
}

// Right
difference() {
    rotate([0, 0, 33]) cube([8, 8.1, height]);
    translate([6, 1, 0]) cube([17, 5, hole_depth]);
    translate([-6, 5, 0]) cube([10, 4, hole_depth]);
  }

translate([-1.3, 9, 0]) cube([2, 3, height]);

 difference() {
    translate([-4.4, 6.8, 0]) rotate([0, 0, -30]) cube([7, 6, height]);
    translate([6, 1, 0]) cube([17, 5, hole_depth]);
    translate([-6, 5, 0]) cube([10, 4, hole_depth]);  
  }
  
  // Left
  translate([21.3, 4.35, 0]) {
  difference() {
    rotate([0, 0, -33]) cube([8, 8.1, height]);
    translate([-15.3, -3.35, 0]) cube([17, 5, hole_depth]);
    translate([2.7, 0.65, 0]) cube([10, 4, hole_depth]);
  }

  translate([6.0, -4.35, 0]) {
    translate([0, 9, 0]) cube([2, 3, height]);
  }

  difference() {
    translate([5.06, -1.06, 0]) rotate([0, 0, 30]) cube([7, 6, height]);
    translate([-16.3, -3.35, 0]) cube([17, 5, hole_depth]);
    translate([2.7, 0.65, 0]) cube([10, 4, hole_depth]); 
  }
}
  