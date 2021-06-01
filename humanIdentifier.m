clc;
clear all;
close all;

vid = vision.VideoFileReader('vtest.avi');
vid_play = vision.VideoPlayer('Position',[300 100 1000 500]);

detector = peopleDetectorACF();

while ~isDone(vid)
    frame = step(vid);
    I=double(frame);
    [bboxes,scores] = detect(detector,I);
    
    
    if ~isempty(bboxes)
         I= insertObjectAnnotation(I,'rectangle',bboxes,scores,'color','g');
    end
    step(vid_play,I);
end

release(vid);
release(vid_play);
