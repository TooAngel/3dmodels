height = 9;
hole_depth = 6;

difference() {
    cube([29, 12, height]);
    translate([6, 1, 0]) cube([17, 5, hole_depth]);
    translate([0, 5, 0]) cube([4, 4, hole_depth]);
    translate([25, 5, 0]) cube([4, 4, hole_depth]);
    translate ([14.5, 12, 0]) cylinder(hole_depth, r=5);
}

translate([-2, 9, 0]) cube([2, 3, height])

difference() {
    rotate([0, 0, 20]) cube([7, 7, height]);
     translate([6, 1, 0]) cube([17, 5, hole_depth]);
    translate([-4, 5, 0]) cube([8, 4, hole_depth]);
  }

 difference() {
    translate([-4.4, 6.8, 0]) rotate([0, 0, -30]) cube([7, 6, height]);
    translate([6, 1, 0]) cube([17, 5, hole_depth]);
    translate([-6, 5, 0]) cube([10, 4, hole_depth]);  
  }
  