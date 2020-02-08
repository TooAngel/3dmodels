threadDiameter = 4;
knobDiameter = 15;

difference() {
    sphere(r=knobDiameter/2);
    cylinder(r=threadDiameter / 2, knobDiameter*0.75);
}