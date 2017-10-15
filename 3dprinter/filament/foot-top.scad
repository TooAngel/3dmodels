difference() {
	cube([50, 50, 10]);
	translate([25,50,0]) {cylinder(10, r=7);}
}

translate([0,-5,0]) {
	cube([12,5,5]);
	translate([25.5,0,0]) {cube([12,5,5]);}
}
translate([12.5,-5,5]) {
	cube([12,5,5]);
	translate([25.5,0,0]) {cube([12,5,5]);}
}
