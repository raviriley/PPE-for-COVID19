/*
3D Verkstan Face Shield Stacker

    This script generates a vertical stack of face shield frames, which enables many frames to be printed at once. You can either max out your build volume or choose the number of frames you want in the stack.
    
Created by Ravi Riley
*/

//Choose North American, Swedish, European, or the Prusa visor compatible variant of the face shield
Variant = "North America"; //[North America, Sweden, Europe, Prusa Compatible]
//(mm)
Build_volume_height = 200;
//(mm)
Layer_height = 0.25;

//Generate max number of frames that can fit in the entered build volume or a user specified amount
Number_of_face_shield_frames_in_a_stack = "User Specified"; //[User Specified, Maximum]

//Number of face shield frames (ignore if you chose maximum above)
User_Specified = 1;

//Number of layers between each face shield frame
Layer_gap = 2; 
/*
    With a 0.4mm nozzle, a 0.25mm layer height works great with a 2 layer gap on my printer. If you are printing with a larger layer height, I suggest decreasing the layer gap to 1 layer.
*/

/* [Hidden] */
unit_height = (5+(Layer_gap*Layer_height)); //5mm = height of each face shield frame
echo ("Unit Height:");
echo (unit_height);

max_frames = floor(Build_volume_height/unit_height); //max number of face shield frames that can fit in the entered build volume
echo ("Max frames:");
echo (max_frames);

if (Number_of_face_shield_frames_in_a_stack == "User Specified") {
    current_height = (User_Specified*unit_height-0.5);
    echo ("Current height:");
    echo (current_height);
}
else {
    current_height = (max_frames*unit_height-0.5);
    echo ("Current height:");
    echo (current_height);
}

/// end customizable parameters ///
//include <utils/build_plate.scad>; //for Thingiverse Customizer

module frame() {
    if (Variant == "North America") import("North America 6hole_v5 solid front.stl", convexity=10);
    else if (Variant == "Sweden") import("Sweden_v11-solid_front.stl", convexity=10);
    else if (Variant == "Europe") import("Europe ISO838_v4-solid_front.stl", convexity=10);
    else import("Prusa Compatible solid-front.stl", convexity=10);
}

module stacker(num) {
   for (i = [0 : num-1])
       translate([ 0, 0, unit_height*i ]) children(0);
}

module stack(num) { stacker(num){frame();} }

module maxStack() stack(max_frames);

if (Number_of_face_shield_frames_in_a_stack == "Maximum") maxStack(); else stack(User_Specified);
