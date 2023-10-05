clear all
close all
clc

load("yolov3Detector_squeeznet.mat");

location = 'D:\Datasets\drones\samples';
imgs_loc = dir(location);
imgs_loc(1:2) = [];
    for i=1:length(imgs_loc)
%         i
        imageFilename = fullfile(location,imgs_loc(i).name);
        img = imread(imageFilename);
        [bboxes,scores,labels] = detect(yolov3Detector,img);
        if(~isempty(bboxes))
            img = insertObjectAnnotation(img,'rectangle',bboxes,scores);
%             imshow(I)
%             drawnow
%             pause
        end
        imshow(img)
            drawnow
            pause
    end

