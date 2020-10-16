function [BW,xnnz] = threshRGB2Lab(img)%#codegen
    % Create mask based on chosen histogram thresholds
    % For this example, we convert to Lab space and then threshold
    % Convert RGB image to chosen color space
    
    % Copyright 2018 The MathWorks, Inc.
    
    
    I = rgb2lab(img);

    % Define thresholds for channel 1 based on histogram settings
    channel1Min = 39.706;
    channel1Max = 99.950;

    % Define thresholds for channel 2 based on histogram settings
    channel2Min = -53.085;
    channel2Max = -14.555;

    % Define thresholds for channel 3 based on histogram settings
    channel3Min = -27.084;
    channel3Max = 43.633;

    % Create mask based on chosen histogram thresholds
    sliderBW = (I(:,:,1) >= channel1Min ) & (I(:,:,1) <= channel1Max) & ...
        (I(:,:,2) >= channel2Min ) & (I(:,:,2) <= channel2Max) & ...
        (I(:,:,3) >= channel3Min ) & (I(:,:,3) <= channel3Max);
    BW = sliderBW;
    
    % Get the x coordinate of max nonzero pixels along vertical
    numnnz = sum(BW,1);
    [~,xnnz] = max(numnnz);
    
end