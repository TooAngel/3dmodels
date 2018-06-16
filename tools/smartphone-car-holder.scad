include <../lib/threads.scad>
 
width = 24;
length = 30;
height = 12;
thickness = 3;

thredRadius = 5;

cantileverWidth = 16;
cantileverLength = 1.5;
cantileverRatio = (1 - (cantileverWidth / width)) / 2;
echo(cantileverRatio);

$fn=100;

module filleting() {
    difference() {
        translate([0, 0, 0]) cube([cantileverLength, cantileverWidth, cantileverLength]);
        rotate([-90, 0, 0]) cylinder(r=0.5 * thickness, cantileverWidth);
    }
}

translate([0, 0, thickness]) rotate([90, 0, 0]) {
    difference() {
        translate([0, cantileverRatio * width, 0]) cube([length, cantileverWidth, height]);
        translate([thickness, cantileverRatio * width, 0]) cube([length - 2 * thickness, cantileverWidth, height]);
    }

    translate([-thickness, -thickness, height]) difference() {
        cube([length + 2 * thickness, width +  2 * thickness, height + thickness]);
        translate([3 * thickness, 3 * thickness, 0]) cube([length - 4 * thickness, width - 4 * thickness, height - thickness]);
        translate([length/2 + thickness, width/2 + thickness, height - thickness]) metric_thread (diameter=8, pitch=1, length=2 * thickness, internal=true);    
    }
        

    polyhedron(
        points=[
            [0, cantileverRatio * width, 0.5 * height],
            [0, (1 - cantileverRatio) * width, 0.5 * height],
            [-cantileverLength, (1-cantileverRatio) * width, 0.5 * height],
            [-cantileverLength, cantileverRatio * width, 0.5 * height],
            [0, cantileverRatio * width, 0],
            [0, (1 - cantileverRatio) * width, 0]
        ],
        faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
    );

    polyhedron(
        points=[
            [length, cantileverRatio * width, 0.5 * height],
            [length, (1 - cantileverRatio) * width, 0.5 * height],
            [length + cantileverLength, (1 - cantileverRatio) * width, 0.5 * height],
            [length + cantileverLength, cantileverRatio * width, 0.5 * height],
            [length, cantileverRatio * width, 0],
            [length, (1 - cantileverRatio) * width, 0]
        ],
        faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
    );

    translate([-cantileverLength, cantileverRatio * width, height - cantileverLength]) filleting();
    translate([length - 1.5 * thickness , cantileverRatio * width, height - cantileverLength]) filleting();
    translate([1.5 * thickness, cantileverRatio * width + cantileverWidth, height - cantileverLength]) rotate([0, 0, 180]) filleting();
    translate([length + 0.5 * thickness, cantileverRatio * width + cantileverWidth, height - cantileverLength]) rotate([0, 0, 180]) filleting();
}