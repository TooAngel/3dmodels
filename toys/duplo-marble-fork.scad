// Duplo-compatible marble run fork (C) by Tobias Wilken
// LEGO and DUPLO are trademarks of the Lego group.

// The duplo-marbelrun-lib and duplo-block-lib are from https://www.thingiverse.com/thing:159219
// The duplo-block-lib is derived from http://www.thingiverse.com/thing:1778


include <../lib/duplo-marblerun.scad>

quality = 50; // quality: low/fast (e.g. 10) for design, high/slow (e.g. 50) for final rendering

innerRadius=14*dr/16;

forkPiece();

module forkPiece()
{
   difference() {
      duploMarbleRunBase(2,2,3,false);
      // inflow
      translate([0,dr+1, duploHeight+6]) rotate([90,0,0])
         cylinder( duploRaster*1, innerRadius, innerRadius,$fn = quality*2 );

      // outflow
             translate([-1.5 * dr-2, 0, duploHeight-6]) rotate([0,70,0])
         cylinder( duploRaster*4, innerRadius, innerRadius,$fn = quality*2 );
           translate([1.5 * dr-2, 0, duploHeight-4]) rotate([0,70,180])
         cylinder( duploRaster*4, innerRadius, innerRadius,$fn = quality*2 );

     // translate([-dr-1,0, duploHeight-2]) rotate([0,90,0])
      //   cylinder( duploRaster*4, innerRadius, innerRadius,$fn = quality*2 );
   }
   // outflow

}
