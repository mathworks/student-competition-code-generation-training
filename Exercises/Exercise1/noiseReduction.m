%% Initialize data
clear
close all
load data

% Define constants and structures                
NFFT = 256;

par.D = 60;
par.q = 0.5;                    % Quantile used in noise model estimation
par.wOverEstGain = 2;           % Noise over estimation gain

% Initialize data
xEnhanced = zeros(numel(y),1);	% Initialise a vector to store the restored
Y = complex(zeros(NFFT,1));
XHat = complex(zeros(NFFT,1));
SwHat = zeros(NFFT,1);
Tab = zeros(NFFT,par.D);
%% Loop framewise over input data
step = NFFT/2;
index = 1:NFFT;
for n = 1:floor((numel(y)-step)/step)
    
    % Transform data to frequency domain
    yn = y(index).*hanning(NFFT);
    [xHat, Tab] = speechEnhancement(yn, n, par, Tab, NFFT);
    
    % Overlap and add
    xEnhanced(index) = xEnhanced(index) + xHat;
    index=index+step;
end

%% Visualize results
plotTraces(t,y,x,xEnhanced);