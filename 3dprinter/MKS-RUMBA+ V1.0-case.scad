thickness = 3;

boardLength = 140;
boardLengthPadding = 2;

boardLengthTotal = boardLength + 2 * boardLengthPadding + 2 * thickness;

boardWidth = 75;
boardWidthPaddingLeft = 3;
boardWidthPaddingRight = 20;
boardWidthTotal = boardWidth + boardWidthPaddingLeft + boardWidthPaddingRight + 2 * thickness;

screwDiameter = 4;
screwDiameterPadding = 1;
screwBoardHeightPadding = 2;
screwBoardRadiusPadding = 2;
screwHoleRadius = (screwDiameter + screwDiameterPadding) / 2;

bottomLeftLength = 9;
bottomLeftWidth = 4;

topRightLength = 138;
topRightWidth = 36;

usbConnectorWidth = 63;
usbPlugWidth = 12;
usbPlugHeight = 12;

usbConnectorHoleWidth = usbConnectorWidth - (usbPlugWidth / 2);

bottomCabelInputPadding = 1;
bottomCabelInputWidth = 20;
bottomCabelInputHeight = 20;

rightCabelInputPadding = 10;
rightCabelInputWidth = 20;
rightCabelInputHeight = 20;

boarderThickness = 50;

cableHolderWidth = 25;
cableHolderHeight = 30;
cableHolderWidthOffset = 60;

cabHolderWidth = 10;
cabHolderHeight = 4;
cabHolderHeightOffset = 10;
cabHolderLegthOffsetFirst = boardWidthTotal / 4 - cabHolderWidth / 2;
cabHolderLegthOffsetSecond = 3 * boardWidthTotal / 4 - cabHolderWidth / 2;

airHoleRadius = 2;
airHoleLengthDistance = 3;
airHoleHeightPadding = 5;
airHoleLengthPadding = 10;

difference() {
    cube([boardLengthTotal, boardWidthTotal, boarderThickness]);
    
    // Remove the inner block
    translate([thickness, thickness, thickness]) cube([boardLength + 2 * boardLengthPadding, boardWidth + boardWidthPaddingLeft + boardWidthPaddingRight, boarderThickness]);
    
    // Drill bottom left hole
    translate([thickness + boardLengthPadding + bottomLeftLength, thickness + boardWidth + boardWidthPaddingRight -  bottomLeftWidth, 0] ) cylinder(r=screwHoleRadius, thickness);
    
    // Drill bottom right hole
    translate([thickness + boardLengthPadding + topRightLength, thickness + boardWidth + boardWidthPaddingRight - topRightWidth, 0] ) cylinder(r=screwHoleRadius, thickness);
    
    // USB Connector
    translate([0, boardWidthTotal - thickness - boardWidthPaddingLeft - usbConnectorHoleWidth - usbPlugWidth, thickness]) cube([thickness, usbPlugWidth, usbPlugHeight]);
    
    // Bottom cabel input
    translate([0, thickness + bottomCabelInputPadding, thickness]) cube([thickness, bottomCabelInputWidth, bottomCabelInputHeight]);
       
    // Right cabel input
    translate([thickness + boardLength + 2 * boardLengthPadding - rightCabelInputPadding - rightCabelInputWidth, 0, thickness]) cube([rightCabelInputWidth, thickness, rightCabelInputHeight]);
    
    // CableHolder
    translate([0, cableHolderWidthOffset, 0]) cube([cableHolderHeight, cableHolderWidth, thickness]);
    
    // CabHolder Bottom
    translate([0, cabHolderLegthOffsetFirst, boarderThickness - cabHolderHeightOffset]) cube([thickness, cabHolderWidth, cabHolderHeight]);
    translate([0, cabHolderLegthOffsetSecond, boarderThickness - cabHolderHeightOffset]) cube([thickness, cabHolderWidth, cabHolderHeight]);
    
     // CabHolder Top
    translate([boardLengthTotal - thickness, cabHolderLegthOffsetFirst, boarderThickness - cabHolderHeightOffset]) cube([thickness, cabHolderWidth, cabHolderHeight]);
    translate([boardLengthTotal - thickness, cabHolderLegthOffsetSecond, boarderThickness - cabHolderHeightOffset]) cube([thickness, cabHolderWidth, cabHolderHeight]);
    
    // Air holes
    for (height = [1:3]) {
        for (length = [1:17]) {
            translate([airHoleLengthPadding + length * (airHoleLengthDistance + 2 * airHoleRadius), boardWidthTotal, airHoleHeightPadding + height * 6]) rotate([90, 0, 0]) cylinder(r=airHoleRadius, thickness);
        }
    }
}

// Drill bottom left hole
difference() {
    translate([thickness + boardLengthPadding + bottomLeftLength, thickness + boardWidth + boardWidthPaddingRight -  bottomLeftWidth, 0] ) cylinder(r=screwHoleRadius + screwBoardRadiusPadding, thickness + screwBoardHeightPadding);
    translate([thickness + boardLengthPadding + bottomLeftLength, thickness + boardWidth + boardWidthPaddingRight -  bottomLeftWidth, 0] ) cylinder(r=screwHoleRadius, thickness + screwBoardHeightPadding);
}

// Drill bottom right hole
difference() {
    translate([thickness + boardLengthPadding + topRightLength, thickness + boardWidth + boardWidthPaddingRight - topRightWidth, 0] ) cylinder(r=screwHoleRadius + screwBoardRadiusPadding, thickness + screwBoardHeightPadding);
    translate([thickness + boardLengthPadding + topRightLength, thickness + boardWidth + boardWidthPaddingRight - topRightWidth, 0] ) cylinder(r=screwHoleRadius, thickness + screwBoardHeightPadding);
}

