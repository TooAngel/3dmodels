width = 89;
width_top = 87;
width_middle = 85;
width_middle_top = 83;
length = 25;
length_top = 23;
length_middle = 37;
length_middle_top = 35;

height = 60;

foot_width = 150; //200;
foot_length = 100; //165;
foot_height = 10;


union() {
translate([0, 0, foot_height - 3]) rotate([10, 0, 0]) polyhedron(
    points= [
        [-width / 2, -length / 2, 0],
        [-width_middle / 2, 0, 0],
        [-width / 2, length / 2, 0],
        [0, length_middle / 2, 0],
        [width / 2, length / 2, 0],
        [width_middle / 2, 0, 0],
        [width / 2, -length / 2, 0],
        [0, -length_middle / 2, 0],
        
        [-width_top / 2, -length_top / 2, height],
        [-width_middle_top / 2, 0, height],
        [-width_top / 2, length_top / 2, height],
        [0, length_middle_top / 2, height],
        [width_top / 2, length_top / 2, height],
        [width_middle_top / 2, 0, height],
        [width_top / 2, -length_top / 2, height],
        [0, -length_middle_top / 2, height],
    ],
    faces = [
                [7, 6, 5, 4, 3, 2, 1, 0],
                
                [0, 1, 9, 8], 
                [1, 2, 10, 9],
                [2, 3, 11, 10],
                [3, 4, 12, 11],
                [4, 5, 13, 12],
                [5, 6, 14, 13],
                [6, 7, 15, 14],
                [7, 0, 8, 15],
                
                [8, 9, 10, 11, 12, 13, 14, 15],
            ]
);

translate([-foot_width/2, -foot_length/2, 0]) cube([foot_width, foot_length, foot_height]);
}