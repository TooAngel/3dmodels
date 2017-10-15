length = 40;

difference()  {
    rotate_extrude(angle=90, convexity=10)
   translate([20, 0]) circle(10);
    cube([10, 10, 10]);
}