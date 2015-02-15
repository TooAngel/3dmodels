frame_height = 20;
frame_width = 150;
frame_thick = 2;
back_height = 60;

difference() {
	cube([frame_width + (2 * frame_thick),back_height,frame_height]);
	translate([frame_thick,frame_thick,0]) {cube([frame_width,back_height - (2 * frame_thick),frame_height]);}
}
cube([frame_width + (2 * frame_thick),20,frame_thick]);

translate([0,10,0]) {rotate([45,0,0]) {cube([frame_width + (2 * frame_thick),back_height,2]);}}