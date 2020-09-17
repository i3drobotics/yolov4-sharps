# yolov4-sharps

PYTHON CODE TO CREATE RANDOM DEFECTS ON A STEEL PLATE IN BLENDER 2.8 USING PIL AND OPENCV TO MANAGE IMAGES

The paths need to be changed to paths to your python packages

The file structure used whilst writing this add-on was:

```
steel-blender 
 ├── brushes ~~ at this level is the image for scale-only
 │   ├── in
 │   └── out
 └── defects ~~ this folder is where we saved the images with the defects
 ```

In order to get blender's ```python``` to understand and use ```pillow``` and ```opencv``` to work with the images we are using, we need to check that it knows where to look for all the correct packages, so it is necessary to find where ```PIL``` and ```cv2``` are installed in our system and to check whether or not they are compatible with ```blender 2.8``` python (normally ```python 3.5```). Thus, it is of utmost importance to use these three lines:

```
import sys
path_to_packages = '/PATH/TO/LOCAL/PYTHON/3.7/site-packages'
sys.path.append(path_to_packages)
```
After importing all the relevant packages we then change some options in ```blender``` to work in the ```Cycles``` render engine, with the ```experimental``` feature and add an option for it to be computed using the GPU.

The code works by creatig an add-on in the ```3D-View```, which is the menu that appears where you are in _Object mode_ inside ```blender```. The way the add-on is written follows ```blender```'s naming rules, and types; there are plenty of different functions that could in principle be added here, to see them one can simply go to ```blender```'s python terminal and use the tab to autocomplete and add them. Another useful tool is to turn on the add-on that allows one to see all the ```python``` code needed to point/use ```blender```'s options.

Once the add-on is created, we need to create an execution operator, that will run our script every time the _Generate random plate_ button is pressed in the ```3D-View```, and it is there where all the calculations (to place the defects) and the creation of three different _masks_ that had the defects painted on them are generated.

Before fully going into how the "painting" works within the code, it is important to understand how ```blender``` works with materials, and in this script we have created a material using just the python script and that is given from lines 168 to 243, within these lines the user can choose and change the default properties of the materials, add more or remove as many as desired. The material consists of nodes that are interconected with a ```Principled BSDF``` node controlling the output, meaning metalicity, roughness, etc. can be modified within this node or "injected" into it, as we do for the metalic texture of our plate.

After the _shader_ is where we add the different defects that were generated randomly within the script, normally called _displacement-in_ or _out_, and both of these masks are used as _bumps_ and _displacements_ within the node interface in ```blender```, this is the reason why we have changed the render engine to ```Cycles >> Experimental``` and changed the settings within the material to add _bump_ and _displacement_. **Note.** Most of the necessary settings for this to work are modified within the script between lines 72-76.

# Painting random defects

We use ```pillow``` and ```opencv``` to work the images that we need, we first need to read the masks that we have created in ```gimp``` or any other image editor like ```MS Paint``` or ```Photoshop```, the only necessary thing with this image is that the height is five times the width, which can be seen in lines 34 and 35:

```
width = 1024
height = 5120
```
once we have the images we ope them using ```PIL```
```
## ~~~~~~~~~~~~~ DRAWING THE DEFFECTS ~~~~~~~~~~~~~
# Image that will be 'the background' plate where the defects will be drawn
disp_out = Image.open('/PATH/TO/THE/BLANK/IMAGE/TO/PAINT-OUT/displacement-out.png')
disp_in = Image.open('/PATH/TO/THE/BLANK/IMAGE/TO/PAINT-IN/displacement-in.png')
```
this PATH depends from user to user, not necessarily needing to follow the structure outlined at the beginning of this README, it just needs to go to the images that will be used to be 'painted on'.

Thus, we start the painting, painting displacement going inwards and outwards works the same, the only separate one is the scale, which will always be a displacement going out of the plate and will, most likely, cover the whole plate without any random rotation, or resizing unlike all the other defects that we paint on the plates.

The way painting works is we create three different arrays, which will be _"brush arrays"_ and a special one that is the _"scale array"_, these are created appending the ```*.png``` files that we have in the _brushes_ directory, again following the file structure mentioned above.

Next, we paint the scale on the mask of the _displacement-out_ since it is a defect that comes out along the line of sight if one is looking at the plate along the z-axis, just like our set of cameras for stereo vision. Once the plate is full of scale, we need to give the number of defects we want our generator to add to the now _scaly_ plate, it is defaulted at five random defects but it can be modified within the script to be as many defects as one would like. 
```
n_def = 5
```
_**Note.** The amount of defects does modify the time the generator needs to work, the step that takes the longest is filling the plate with scale, but if we then added 100 defects on top of the scale the time needed may be longer than the 5-12 seconds it takes at lower numbers of defects._

The defects are placed on the plate by randomly taking ```(x,y)``` in ```(width, height)``` and placing them on the mask, painting the defect 'white' on the 'black' (blank) image we started with, this is so ```blender``` understands that the white patches are the ones to take into account whilst rendering the material. In lines 162-166 it can be seen that we save three images instead of two, this is to be able to see the plates without scale, since sometimes one would like to see _only_ the defects going _in_ and _out_ instead of a _scaly_ plate with defects. One can toggle between these by just changing the _displacements-out-scale_ image for _displacements-out_ in the _image texture_ node in the _shading_ tab in ```blender```.

The only thing that would be left to do is to render the images or animation needed with the plate. It is important to note that the way this script was written was so we can add defect brushes in the future so our library of defects can be even bigger, and more realistic.

After the plate is generated and rendered, one can just press the _Generate random plate_ button again and our previous plate will be deleted and a new one will be created with different defects.

## Future additions
