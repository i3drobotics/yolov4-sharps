import os
import glob
os.system
import PIL
import PIL.Image as Image

d = 0
test_Path = r'/home/i3dr/Desktop/YOLOv4/darknet/data/test'
with open((test_Path + '.txt'),'r') as fobj:
	for line in fobj:
		image_List = [[num for num in line.split()] for line in fobj]
		for images in image_List:
			commands = ['./darknet detector test build/darknet/x64/data/sharps.data cfg/yolov4-sharps.cfg backup/yolov4-sharps_final.weights -thresh 0.65 -dont_show', images[0]]
			os.system(' '.join(commands))
			predicted_image = Image.open("/home/i3dr/Desktop/YOLOv4/darknet/predictions.jpg")
			output = "/home/i3dr/Desktop/YOLOv4/darknet/predictedimages/predicted_image_%d.jpg"%d
			predicted_image.save(output)
			d+=1
