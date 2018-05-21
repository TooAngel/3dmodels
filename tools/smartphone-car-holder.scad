width = 26;
length = 32;
height = 10;
thickness = 1;

triangleThickness = 2;

difference() {
    cube([length, width, height]);
    translate([thickness, thickness, thickness]) cube([length - 2 * thickness, width - 2 * thickness, height - thickness]);
}

translate([0, 0, height]) difference() {
    cube([length, width, height]);
    translate([thickness, 0, 0]) cube([length - 2 * thickness, width, height]);
}

polyhedron(
    points=[
        [0, 0, 1.5 * height],
        [0, width, 1.5 * height],
        [-triangleThickness, width, 1.5 * height],
        [-triangleThickness, 0, 1.5 * height],
        [0, 0, 2 * height],
        [0, width, 2 * height]
    ],
    faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
);

polyhedron(
    points=[
        [length, 0, 1.5 * height],
        [length, width, 1.5 * height],
        [length + triangleThickness, width, 1.5 * height],
        [length + triangleThickness, 0, 1.5 * height],
        [length, 0, 2 * height],
        [length, width, 2 * height]
    ],
    faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
);