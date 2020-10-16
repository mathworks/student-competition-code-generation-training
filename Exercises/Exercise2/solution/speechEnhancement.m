function xHat = speechEnhancement(y, n, par, NFFT)
%#codegen

coder.cstructname(par,'myStruct')
% Transform data to frequency domain
Y = fft(y,NFFT);

% Estimate noise spectrum
SwHat = noiseEstimator(Y, n, par, NFFT);

% Spectral subtraction Sx = Sy - Sw
XHat = spectralSubtraction(Y, SwHat, NFFT);

% Transform back to time domain
xHat = real(ifft(XHat));

end