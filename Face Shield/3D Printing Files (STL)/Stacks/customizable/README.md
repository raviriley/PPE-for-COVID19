### Features
I created a customizable OpenSCAD script that allows you to easily pick the variant you need and build vertical stacks to mass-produce face shields.
- Number of parts in a stack - either specify a number yourself or let the script calculate the max number of face shields that will fit in your build volume.
- Variant selection - easily choose between one of the four (North America, Europe, Sweden, and Prusa visor compatible)
- automatic 2-layer spacing between each face shield frame
- custom layer gap between each part

Note: for the .scad to work offline, download the .zip folder as it contains all needed files.

### Print Settings
No supports!

With a 0.4mm nozzle, a 0.25mm layer height works great with a 2 layer gap on my printer. If you are printing with a larger layer height, I suggest decreasing the layer gap to 1 layer.

In order for the layer gap to work correctly, every layer must be an integer multiple of the layer height. This means the first layer MUST BE 100% of the layer height, or 200%, 300%, etc. 
