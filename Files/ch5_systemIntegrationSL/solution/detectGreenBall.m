function [x,y,mask] = detectGreenBall(frameIn)
%#Codegen 

% Copyright 2018 The MathWorks, Inc.
% This function thresholds the image based on threshold values submitted by
% the user

%% Setup the detector and initialize variables
persistent detector 
if isempty(detector)
    detector = vision.BlobAnalysis('BoundingBoxOutputPort',false,...
        'AreaOutputPort',false,'MinimumBlobArea',300, ...
        'MajorAxisLengthOutputPort',true,'MaximumCount', 10);
end
x = 0;
y = 0;
threshold = [107.00 225.00; 85.000 120.000; 82.000 121.000];

%% Threshold the image
frameIn = rgb2ycbcr(frameIn);
mask = (frameIn (:,:,1) >= threshold(1,1))& (frameIn (:,:,1) <= threshold(1,2))&...
    (frameIn (:,:,2) >= threshold(2,1))& (frameIn (:,:,2) <= threshold(2,2))&...
    (frameIn (:,:,3) >= threshold(3,1))& (frameIn (:,:,3) <= threshold(3,2));

[centroid,majorAxis] = detector(mask);


if ~isempty(majorAxis)
% Identify Largest Blob
    [~,mIdx] = max(majorAxis);
    C = centroid(mIdx,:);
    x = double(C(1));
    y = double(C(2));

end 

end 