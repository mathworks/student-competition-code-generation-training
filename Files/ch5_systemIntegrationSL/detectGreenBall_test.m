% Copyright 2018 The MathWorks, Inc.

close all
clear
clc

%% SETUP
% Create video file reader for input
camReader = imaq.VideoDevice('winvideo');
camReader.ReturnedDataType = 'uint8';
% Create video player for visualization
vidPlayer = vision.DeployableVideoPlayer;

%% LOOP
for idx = 1:50
    
    %% GET DATA
    img = camReader();
    
    %% PROCESS
    [x,y,mask] = detectGreenBall(img);
    
    %% VISUALIZE
    outframe = insertMarker(img,[x y]);
    step(vidPlayer,outframe);
    pause(0.3)
end

%% VERIFY
disp([x y])

%% CLEANUP
release(camReader)
release(vidPlayer)