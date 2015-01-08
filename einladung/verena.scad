difference() {
    translate([-55,-2,0]){cube([90, 17, 5]);}

    translate([35,0,0]) {
        mirror([1,0,0]){
            linear_extrude(height = 3) {
                text("VERENA", font="Nelson Script:style=Bold", size=8, spacing=1, size=10);
//                            text("Verena", size=8, font="default:style=Bold", spacing=1, size=15);
            }
        }
    }
    
}