accus = 10;
gradient = 10;
accu_diameter = 18; 
accu_length = 67; // 65 plus padding
thickness = 2;


length = accus * accu_diameter;

// Height
// sin alpha = opposite / hypothenuse
// height = length * sin gradient
height = length * sin(gradient);
echo("Height: ", height);

// Base offset
// Due to different ankle
// sin alpha = opposite / hypothenuse
// base_offset = thickness * sin gradient
base_offset = thickness * sin(gradient);
echo("Base offset: ", base_offset);

// Case length
// cos alpha = adjacent / hypothenuse
// case_length = length * cos gradient
case_length = length * cos(gradient) + base_offset;
echo("Case length: ", case_length);

// Grip offset
// sin alpha = opposite / hypothenuse
// grip_offset = accu_diameter / 2 * sin gradient
grip_offset = accu_diameter / 2 * sin(gradient);
echo("Grip offset: ", grip_offset);

back_height = sin(gradient) * (length + 2 * thickness);

hook_length = 20;

// hook
translate([-2 * thickness, (accu_length + 2 * thickness) / 2 - hook_length / 2, 0]) cube([2 * thickness, hook_length, thickness]);
translate([-2 * thickness, (accu_length + 2 * thickness) / 2 - hook_length / 2, thickness]) cube([thickness, hook_length, 2 * thickness]);


difference() {
    cube([case_length + 2 * thickness, accu_length + 2 * thickness, back_height]);
    translate([thickness, thickness, 0]) cube([case_length, accu_length, back_height]);
    
    // hole for hook
    translate([case_length + thickness, (accu_length + 2 * thickness) / 2 - hook_length / 2, 0]) cube([thickness, hook_length, thickness]);
    
    translate([case_length + 1.6 * thickness, 0, 7]) rotate([90, 0, 90]) linear_extrude(thickness / 2) text("TooAngel", size=4, font="Deftone Stylus:style=Regular");
    translate([case_length + 1.6 * thickness, 0, 2]) rotate([90, 0, 90]) linear_extrude(thickness / 2) text("Design", size=4, font="Deftone Stylus:style=Regular");
}

// frame
translate([thickness, thickness, back_height - thickness])
difference() {
    cube([case_length, accu_length, 3 * thickness]);
    translate([thickness, thickness, 0]) cube([case_length - 2 * thickness, accu_length - 2 * thickness, 3 * thickness]);
}