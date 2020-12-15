# Implementation of YOLOv4 for sharp object detection

Included in this repository are the master to build ```yolov4```, makefiles and other README's are inside the directory.

To then use the pre-trained weights in the command line just write:
```
darknet.exe detector test data/obj.data yolo.cfg yolo.weights
```
where the .data, .cfg and .weights should be the ones we have provided (or are in i3D ML Google Drive).

**Note.** This command line snipet works if the files are in the required repositories, but one can also call them with their explicit path, i.e. ```/usr/where_data_file_is/obj.data``` and so on.

**Note.** The weight files were too heavy to upload to GitHub so they are in the i3D ML Google Drive. The 12,000 epoch one we use for object detection and one more around ~26,000 epochs (not as precise)
