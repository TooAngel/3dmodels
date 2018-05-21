flythickness=10;
width=15;
holderheight=17;
thickness=2.5;

holderheight=15;

rotate([0, -90, 0]) {
difference() {
    cube([width, thickness, holderheight]);
    translate([width / 2, thickness+0.1, holderheight / 2]) rotate([90, 0, 0])  cylinder(h=thickness+0.1, r1=4, r2=2);    
}

translate([0, 0, holderheight - thickness]) cube([width, flythickness, thickness]);
translate([0, flythickness, holderheight - thickness]) cube([width, thickness, holderheight]);
}