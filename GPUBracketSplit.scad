// Overall bracket dims
width = 175;
thickness = 12;
height = 70;

// Position of mounting holes, measured from nearest edge
mounting_hole_1 = 22;
mounting_hole_2 = width - 5;

// GPU dims
cooler_height = 15;     // Height above top of PCI bracket

// PCI dims
pci_length = 120;
pci_height = 40;
pci_edge = 15;
pci_thickness = 2;

// PCI mounting holes
pci_hole_1 = 18;
pci_hole_2 = 36;
pci_hole_in = 6;

// Screw hole size
hole_size = 2;          // Sized to fit 3mm self-tapping screw.
hole_depth = 12;

// Tolerance
tolerance = 0.25;

lower_height = height - cooler_height - pci_height;
$fn = 100;

module bracket_gen() {
    union() {
        difference() {
            cube([width, thickness, height]);
            translate([pci_edge, 0, cooler_height]) {
                cube([pci_length-pci_edge, thickness, pci_height]);
            }
            translate([mounting_hole_1, thickness/2, 0]) {
                cylinder(h = hole_depth, d = hole_size);
            }
            translate([mounting_hole_2, thickness/2, 0]) {
                cylinder(h = hole_depth, d = hole_size);
            }
            translate([pci_length, thickness - pci_hole_in, cooler_height + pci_hole_1]) {
                rotate([0, 90, 0]) {
                    cylinder(h = hole_depth, d = hole_size);
                }
            } 
            translate([pci_length, thickness - pci_hole_in, cooler_height + pci_hole_2]) {
                rotate([0, 90, 0]) {
                    cylinder(h = hole_depth, d = hole_size);
                }
            } 
        }
    }
}


/* creates a mask to split the bracket. Adds some mortice and tenon joints for gluing */
module bracket_mask(t = 0) {
    union() {
        cube([width/2, thickness, height]);
        translate([width/2, thickness/4 - t, height - 3*lower_height/4 - t]) {
            cube([thickness + t, thickness/2 + 2 * t, lower_height/2 + 2 * t]);
        }
        translate([width/2, thickness/4 - t, cooler_height/4 - t]) {
            cube([thickness + t, thickness/2 + 2 * t, cooler_height/2 + 2 * t]);
        }
    }
}

intersection() {
    bracket_gen();
    bracket_mask();
}

translate([thickness + 10, 0, 0]) { 
    difference() {
        bracket_gen();
        bracket_mask(t = tolerance);
    }
}