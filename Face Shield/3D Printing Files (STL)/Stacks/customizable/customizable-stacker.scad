/*
3D Verkstan Face Shield Stacker

    This script generates a vertical stack of face shield frames, which enables many frames to be printed at once. You can either max out your build volume or choose the number of frames you want in the stack.

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

/* [Hidden] */
Layers_gap = 2; //number of layers between each face shield frame
unit_height = (5+(Layers_gap*Layer_height)); //5mm = height of each face shield frame
max_frames = floor(Build_volume_height/unit_height); //max number of face shield frames that can fit in the entered build volume

/// end customizable parameters ///
//include <utils/build_plate.scad>; //for Thingiverse Customizer

module frame() {
    if (Variant == "North America") import("North America 6hole_v5.stl", convexity=10);
    else if (Variant == "Sweden") import("Sweden_v11.stl", convexity=10);
    else if (Variant == "Europe") import("Europe_ISO838_v4.stl", convexity=10);
    else import("Prusa Compatible.stl", convexity=10);
}

module stacker(num) {
   for (i = [0 : num-1])
     translate([ 0, 0, unit_height*i ]) children(0);
}

module stack(num) { stacker(num){frame();} }

module maxStack() stack(max_frames);

if (Number_of_face_shield_frames_in_a_stack == "Maximum") maxStack(); else stack(User_Specified);

//Created by Ravi Riley