/*
 * Name writing (C) by Tobias Wilken
 *
 * Underlined to connect letters
 */

text = "Niklas";
underline_length = 50;

linear_extrude(6) text(text, size=14, font="Deftone Stylus:style=Regular");
translate([0, -2, 0]) cube([underline_length, 2, 6]);