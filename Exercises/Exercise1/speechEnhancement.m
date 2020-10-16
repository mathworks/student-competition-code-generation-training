function [xHat, Tab] = speechEnhancement(y, n, par, Tab, NFFT)

coder.cstructname(par,'myStruct')
% Transform data to frequency domain
Y = fft(y,NFFT);

% Estimate noise spectrum
[SwHat, Tab] = noiseEstimator(Y, Tab, n, par);

% Spectral subtraction Sx = Sy - Sw
XHat = spectralSubtraction(Y, SwHat, NFFT);

% Transform back to time domain
xHat = real(ifft(XHat));

end