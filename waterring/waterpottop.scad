
translate([-100,-2.5,0]) {cube([200,5,5]);}
translate([-2.5, -100,0]) {cube([5,200,5]);}
cylinder(5, r=10);

difference() {
	cylinder(5, r=50);
	cylinder(5, r=40);
}

difference() {
	cylinder(5, r=100);
	cylinder(5, r=90);
}
