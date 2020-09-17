# yolov4-sharps

PYTHON CODE TO CREATE RANDOM DEFECTS ON A STEEL PLATE IN BLENDER 2.8 USING PIL AND OPENCV TO MANAGE IMAGES

The paths need to be changed to paths to your python packages

The file structure used whilst writing this add-on was:

```steel-blender 
 ├── brushes ~~ at this level is the image for scale-only
 │   ├── in
 │   └── out
 └── defects ~~ this folder is where we saved the images with the defects
 ```

In order to get blender's ```python``` to understand and use ```pillow``` and ```opencv``` to work with the images we are using, we need to check that it knows where to look for all the correct packages, so it is necessary to find where ```PIL``` and ```cv2``` are installed in our system and to check whether or not they are compatible with ```blender 2.8``` python (normally ```python 3.5```). Thus, it is of utmost importance to use these three lines:

```import sys
path_to_packages = '/PATH/TO/LOCAL/PYTHON/3.7/site-packages'
sys.path.append(path_to_packages)
```
After importing all the relevant packages we then change some options in ```blender``` to work in the ```Cycles``` render engine, with the ```experimental``` feature and add an option for it to be computed using the GPU.

The code works by creatig an add-on in the ```3D-View```, which is the menu that appears where you are in _Object mode_ inside ```blender```. The way the add-on is written follows ```blender```'s naming rules, and types; there are plenty of different functions that could in principle be added here, to see them one can simply go to ```blender```'s python terminal and use the tab to autocomplete and add them. Another useful tool is to turn on the add-on that allows one to see all the ```python``` code needed to point/use ```blender```'s options.

Once the add-on is created, we need to create an execution operator, that will run our script every time the _Generate random plate_ button is pressed in the ```3D-View```, and it is there where all the calculations (to place the defects) and the creation of three different _masks_ that had the defects painted on them are generated.

Before fully going into how the "painting" works within the code, it is important to understand how ```blender``` works with materials, and in this script we have created a material using just the python script and that is given from lines 168 to 243, within these lines the user can choose and change the default properties of the materials, add more or remove as many as desired. The material consists of nodes that are interconected with a ```Principled BSDF``` node controlling the output, meaning metalicity, roughness, etc. can be modified within this node or "injected" into it, as we do for the metalic texture of our plate.

After the _shader_ is where we add the different defects that were generated randomly within the script, normally called _displacement-in_ or _out_, and both of these masks are used as _bumps_ and _displacements_ within the node interface in ```blender```, this is the reason why we have changed the render engine to ```Cycles >> Experimental``` and changed the settings within the material to add _bump_ and _displacement_. **Note.** Most of the necessary settings for this to work are modified within the script between lines 72-76.

# Painting random defects
