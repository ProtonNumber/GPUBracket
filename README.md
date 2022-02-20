# GPU Bracket
A 3d printable bracket for mounting a GPU upside-down in a Silverstone SST-RVZ03B case. This should improve air flow when the case is on its side. Should be adjustable for other cases by adjusting the parameters at the top of the OpenSCAD file. Also comes in a split format for those with tiny printers (like me). 

## Disclaimer:
 * Ensure that your GPU does not extend more than 15 mm above the PCI bracket. If it does, then adjust cooler_height and regenerate the STLs. Note that this may make it difficult to fit the PCI cable underneath.
 * On the SST-RVZ03B, the standard GPU bracket is also a set of drive bays. You will have either tolerate your drives floating around, print a new drive bay, or use only NVME drives.
 * This may require cutting into your case, which will almost certianly prevent you from returning it. Do so at your own risk.
 * This bracket shifts the GPU as far as possible to one side to create a cable run. This may lead to the case obstructing some ports. If this is undesirable, then you can shift the GPU around by adjusting the mounting holes and overall length in the SCAD file.

## You will need:
 * A 3D printer
 * About 70g of filament
 * A PCI Cable, 200-300mm long, such as [this one](https://www.amazon.co.uk/Cooler-Master-MasterAccessory-Riser-Cable/dp/B08F2DLQDJ) from Cooler Master. Recommend a shorter cable if possible.
 * 4 x 3x10mm self-tapping screws (although you can adjust this in the SCAD file)
 
## You may need:
 * Superglue (if using the split version)
 * Some means of cutting metal e.g. a dremel or tin-snips.

## Printing:
 * Recommend printing with 1.6 mm walls and 20% infill.
 * If you wish, you can only have thick walls around the screw holes. In my experience, this didn't help much, and you may need to adjust the infill accordingly. 
 * Design is quite tolerant of thick layers and sloppy tolerances. If using the split version, you may wish to play with the tolerance parameter in the SCAD file.


