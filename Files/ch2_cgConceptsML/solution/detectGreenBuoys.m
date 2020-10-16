function [center,blobSize,centroids,majorAxes] = detectGreenBuoys(img) %#codegen

    % Copyright 2018 The MathWorks, Inc.

    persistent frameNum
    
    % Threshold to get binary mask
    BW = thresholdGreenBuoys(img);
    
    % Detect blobs
    detector = vision.BlobAnalysis( ...
                    'BoundingBoxOutputPort',false, ...
                    'AreaOutputPort',false, ...
                    'MajorAxisLengthOutputPort', true, ...
                    'MinimumBlobArea',100);
    [centroids_loc,majorAxes_loc] = detector(BW);
        
    % Estimate the blob location and size, if any are large enough
    numBlobs = min(5,length(majorAxes_loc));
    center = zeros(1,2);
    blobSize = 0;
    majorAxes = zeros(5,1);
    centroids = zeros(5,2);
    coder.varsize('majorAxes',[5 1]);
    coder.varsize('centroids',[5 2],[1 0]);
    
    if (numBlobs > 0)
        
        % Assign up to 5 blobs
        for idx = 1:numBlobs
           
            centroids(idx,:) = centroids_loc(idx,:);
            majorAxes(idx,:) = majorAxes_loc(idx);
            
        end
        % Find max blob major axis
        [blobSize,maxIdx] = max(majorAxes(:));
        
        % Find location of largest blob
        maxLoc = centroids(maxIdx,:);
        center(1) = maxLoc(1);
        center(2) = maxLoc(2);
    
    end
    
    % Round off pixel values
    blobSize = roundPixel(blobSize);
    
    % Log info for debugging
    if (coder.target('MATLAB'))
        if isempty(frameNum)
            frameNum = 0;
        end
        frameNum = frameNum + 1;

        if length(majorAxes) > 5
            imgfile = ['frame' num2str(frameNum) '.jpg'];
            imwrite(img,imgfile);
        end
    end