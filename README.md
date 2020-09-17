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
