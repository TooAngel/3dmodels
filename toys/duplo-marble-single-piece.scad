// Duplo-compatible marble run fork (C) by Tobias Wilken
// LEGO and DUPLO are trademarks of the Lego group.

// The duplo-marbelrun-lib and duplo-block-lib are from https://www.thingiverse.com/thing:159219
// The duplo-block-lib is derived from http://www.thingiverse.com/thing:1778

include <duplo-marblerun.scad>

quality = 50; // quality: low/fast (e.g. 10) for design, high/slow (e.g. 50) for final rendering

// duplo base size
width = 2;
length = 2;
height = 3;

// Effective duplo width (tried to extract from both libraries, adjusted manually a bit, can surely be improved or made clearer)
effWidth = 2 * (width * duploRaster - duploWall - 2 * gapBetweenBricks);

// Height of the run way (tried to extract from duplo-marblerun, adjsted manually a bit, can be improved, too)
runHeight = 3.5 * duploHeight; // Height of the marble run
ankle = 70; // Ankle for the outflows, random ankle looks good :-)

ankleWidthOffset = tan(90 - ankle) * runHeight; // Width offset to make sure the run height is correct based on the ankle
ankleHeightOffset = sin(ankle) * innerRadius; // Height offset to make sure the run height is correct based on the ankle

outflowTranslateWidth = effWidth / 2 + ankleWidthOffset;
outflowTranslateHeight = -1.5 * duploHeight + ankleHeightOffset;
outflowCylinderLength = duploRaster*4; // Just long enough

   difference() {
      duploMarbleRunBase(2,1,2,false);
      translate([0,dr+1, duploHeight+2]) rotate([90,0,0])
         cylinder( duploRaster*4, innerRadius, innerRadius,$fn = quality*2 );
   }
