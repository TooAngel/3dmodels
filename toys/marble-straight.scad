include <../lib/duplo-marblerun.scad>

module straightPiece()
{
   difference() {
      duploMarbleRunBase(2,4,2,false);
         translate([0,dr+20, duploHeight+2]) rotate([90,0,0])
         cylinder( duploRaster*6, innerRadius, innerRadius,$fn = quality*2);
   }

}

straightPiece();