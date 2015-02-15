frame_height = 20;
frame_width = 150;
frame_thick = 10;
back_height = 70;

difference() {
	cube([frame_width + (2 * frame_thick),back_height,frame_height]);
	translate([10,10,0]) {cube([frame_width,back_height - (2 * frame_thick),frame_height]);}
}
cube([frame_width + (2 * frame_thick),20,5]);

translate([0,20,0]) {rotate([45,0,0]) {cube([frame_width + (2 * frame_thick),back_height,10]);}}