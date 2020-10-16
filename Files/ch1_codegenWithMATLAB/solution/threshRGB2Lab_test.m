% Copyright 2018 The MathWorks, Inc.

close all
clear
clc

%% SETUP
% Create video file reader for input
vidReader = VideoReader('buoyRun.mp4');
% Create video player for visualization
vidPlayer = vision.DeployableVideoPlayer;

%% LOOP
while(hasFrame(vidReader))    
    
    %% GET DATA
    img = readFrame(vidReader);    
    
    %% PROCESS
    [BW,xnnz] = threshRGB2Lab(img);
          
    %% VISUALIZE
    outframe = insertShape(img,'Line',[xnnz 0 xnnz 480]);
    outframe = insertText(outframe,[580 20],num2str(xnnz),'FontSize',20);
    step(vidPlayer,outframe);
    
end

%% VERIFY
disp(xnnz)

%% CLEANUP
release(vidPlayer)