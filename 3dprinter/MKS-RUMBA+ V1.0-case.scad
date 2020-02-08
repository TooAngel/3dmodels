boardLength = 140;
boardLengthPadding = 1;

boardWidth = 75;
boardWidthPaddingLeft = 1;
boardWidthPaddingRight = 20;

screwDiameter = 4;
screwDiameterPadding = 1;
screwHoleRadius = (screwDiameter + screwDiameterPadding) / 2;

bottomLeftLength = 10;
bottomLeftWidth = 5;

topRightLength = 137;
topRightWidth = 35;

boarderThickness = 6;

thickness = 3;


difference() {
    cube([boardLength + 2 * boardLengthPadding + 2 * thickness, boardWidth + boardWidthPaddingLeft + boardWidthPaddingRight + 2 * thickness, boarderThickness]);
    
    // Remove the inner block
    translate([thickness, thickness, thickness]) cube([boardLength + 2 * boardLengthPadding, boardWidth + boardWidthPaddingLeft + boardWidthPaddingRight, boarderThickness]);
    
    // Drill bottom left hole
    translate([boardLengthPadding + bottomLeftLength, boardWidth + boardWidthPaddingRight -  bottomLeftWidth, 0] ) cylinder(r=screwHoleRadius, thickness);
    
    // Drill bottom right hole
    translate([boardLengthPadding + topRightLength, boardWidth + boardWidthPaddingRight - topRightWidth, 0] ) cylinder(r=screwHoleRadius, thickness);
}

