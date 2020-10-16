function [center,blobSize,centroids,majorAxes] = detectGreenBuoys_fcn(img)

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
    [centroids,majorAxes] = detector(BW);
        
    % Estimate the blob location and size, if any are large enough
    numBlobs = length(majorAxes);
    
    if (numBlobs > 0)
        
        % Find max blob major axis
        [blobSize,maxIdx] = max(majorAxes);
        
        % Find location of largest blob
        maxLoc = centroids(maxIdx,:);
        center(1) = maxLoc(1);
        center(2) = maxLoc(2);
    
    end
    
    % Round off pixel values
    blobSize = roundPixel(blobSize);
    
    % Log info for debugging
    if isempty(frameNum)
        frameNum = 0;
    end
    frameNum = frameNum + 1;

    if length(majorAxes) > 5
        imgfile = ['frame' num2str(frameNum) '.jpg'];
        imwrite(img,imgfile);
    end

end