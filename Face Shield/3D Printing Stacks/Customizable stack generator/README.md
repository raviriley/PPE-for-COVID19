![Demo of OpenSCAD Script](demo.gif)

#### [Thingiverse Customizer Link](https://www.thingiverse.com/apps/customizer/run?thing_id=4311414)

I created a customizable OpenSCAD script that allows you to easily pick the face shield variant you need and build vertical stacks to mass-produce them. If you have OpenSCAD and want to run this locally, download [`run locally.zip`](https://github.com/raviriley/PPE-for-COVID19/raw/master/Face%20Shield/3D%20Printing%20Stacks/Customizable%20stack%20generator%20(for%20single%20extrusion)/run%20locally.zip). This will be much faster than rendering in Thingiverse Customizer. 

### Features
- Number of parts in a stack - either specify a number yourself or let the script calculate the max number of face shields that will fit in your build volume.
- Variant selection - easily choose between one of the four (North America, Europe, Sweden, and Prusa visor compatible)
- Customizable layer height and number of layers of gap between each face shield frame
- Automatic spacing generation between each frame

### Print Settings
No supports!

With a 0.4mm nozzle, a 0.25mm layer height works great with a 2 layer gap on my printer. If you are printing with a larger layer height, I suggest decreasing the layer gap to 1 layer.

In order for the layer gap to work correctly, every layer must be an integer multiple of the layer height. This means the first layer MUST BE 100% of the layer height, or 200%, 300%, etc. 

### How I Designed This
Thingiverse Customizer doesn't support the `import` command, so I converted each STL into an OpenSCAD module using my [STL to OpenSCAD Converter](https://raviriley.github.io/STL-to-OpenSCAD-Converter/). This results in a massive OpenSCAD file, as they all have to be in one file for Customizer to work. 
Originally, I simply used the `import` command to reference each STL, which results in much faster rendering and stack STL generation. `run locally.zip` contains the original .scad file that uses the `import` command, along with each referenced STL. 
