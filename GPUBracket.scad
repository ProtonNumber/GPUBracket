// Overall bracket dims
width = 178;
thickness = 12;
height = 70;

// Position of mounting holes, measured from nearest edge
mounting_hole_1 = 25;
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
tolerance = 0.5;

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

bracket_gen();