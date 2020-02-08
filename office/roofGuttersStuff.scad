smallDiameter = 47;
wideDiameter = 55;
topHeight = 5;
bottomHeight = 24;

$fn=300;

cylinder(r=wideDiameter/2, topHeight);
difference() {
    cylinder(r1=smallDiameter/2+1, r2=smallDiameter/2-1, bottomHeight);
    cylinder(r=smallDiameter/2-3, bottomHeight);
}