rotate([-90,0,0]) {

difference() {
    translate([0,50,0]) cylinder(20, r=73);
    translate([-100, 0,0]) cube([200, 200, 21]);
    //translate([-50, -30,0]) cube([100, 20, 21]);
    
    // Driver hole
    translate([-27, -40,0]) cube([20, 20, 21]);
    translate([0,-26,0]) cylinder(20, r=10);
    
    // axis holes
    translate([-25,-4,0]) cylinder(21, r=1.5);
    translate([24,-6,0]) cylinder(21, r=2);
    
    //box
      translate([2,-15.5,3.5]) cube([28, 16,15]);
    
    // axis openening
    translate([22.0,-6,0]) cube([4, 6, 21]);

   // Motor small part
 translate([30,-2.5,3.5]) cube([1, 1,13]);
    
    //bottom plate
    translate([-4,-2,1.5]) cube([40,2,17]);
    
    //screws
    rotate([-90,0,0]) translate([-1,-10.5,-11.9]) cylinder(10, r=1.8);
    rotate([-90,0,0]) translate([33,-10.5,-11.9]) cylinder(10, r=1.8);    

    // round edges
    translate([47,  -6, 0]) difference() {
        cube([10, 10, 20]);
        translate([0, 5, 0]) cylinder(20, r=6);
        translate([-8, 0, 0]) cube([10, 10, 20]);
    }
    
    translate([-57,  -6, 0]) difference() {
        cube([10, 10, 20]);
        translate([10, 5, 0]) cylinder(20, r=5);
        translate([8, 0, 0]) cube([10, 10, 20]);
    }
    
    // logo
   translate([-20, -5, 1]) rotate([180, 0, 0]) linear_extrude(3) text("TooAngel Design", size=4, font="Deftone Stylus:style=Regular");
    translate([17, -5, 19]) rotate([180, 180, 0]) linear_extrude(3) text("TooAngel Design", size=4, font="Deftone Stylus:style=Regular");

    
}

translate([0, -23, 10]) sphere(r = 9);
    

/*
difference() {
translate([-3.5,-1,2]) cube([39,1,16]);
rotate([-90,0,0]) translate([-1,-10.5,-7.5]) cylinder(10, r=1.8);
 rotate([-90,0,0]) translate([33,-10.5,-7.5]) cylinder(10, r=1.8);    
}
*/
}