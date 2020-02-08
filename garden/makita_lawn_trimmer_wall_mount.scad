radius = 15;

holder_length = 2 * radius + 20;
holder_width = 30;
holder_height = 30;

mount_thickness = 6;
mount_width = 60;
mount_height = 30;

screw_diameter = 6;
screw_head_diameter = 8;
screw_head_length = 4;

mount_overlap = (mount_width - holder_width) / 2.0;

difference() {
    cube([holder_length, holder_width, holder_height]);
    translate([holder_length - radius - 3, holder_width + 1, holder_height]) rotate([90, 0, 0]) cylinder(r=radius, holder_width + 2);    
}

difference() {
    translate([0, -1 * mount_overlap, 0]) cube([mount_thickness, mount_width, mount_height]);
    translate([0, -mount_overlap / 2, mount_height / 2]) rotate([0, 90, 0]) cylinder(r=screw_diameter / 2, 7);
    translate([mount_thickness - screw_head_length + 0.1, -mount_overlap / 2, mount_height / 2]) rotate([0, 90, 0]) cylinder(r1=screw_diameter / 2, r2=screw_head_diameter / 2, screw_head_length);
    translate([0, holder_width + mount_overlap / 2, mount_height / 2]) rotate([0, 90, 0]) cylinder(r=screw_diameter / 2, 7);
    translate([mount_thickness - screw_head_length + 0.1, holder_width + mount_overlap / 2, mount_height / 2]) rotate([0, 90, 0]) cylinder(r1=screw_diameter / 2, r2=screw_head_diameter / 2, screw_head_length);
}
