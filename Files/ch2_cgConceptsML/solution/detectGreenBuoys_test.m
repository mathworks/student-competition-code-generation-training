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
    [center,blobSize,centroids,majorAxes] = detectGreenBuoys(img);
    
    %% VISUALIZE
    outframe = insertShape(img,'Circle',[centroids majorAxes/2],'LineWidth',2);
    outframe = insertMarker(outframe,[center(1) center(2)]);
    step(vidPlayer,outframe);
        
end

%% VERIFY
disp(center)

%% CLEANUP
release(vidPlayer)