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

The code works by creatig an add-on in the ```3D-View```, which is the menu that appears where you are in _Object mode_ inside ```blender```. The way the add-on is written follows ```blender```'s naming rules, and types; there are plenty of different functions that could in principle be added here, to see them one can simply go to ```blender```'s 
