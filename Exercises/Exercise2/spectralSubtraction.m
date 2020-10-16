function XHat = spectralSubtraction(Y, Sw, NFFT)
%#codegen
XHat = coder.nullcopy(complex(zeros(NFFT,1)));

% speech spectral properties - using only half spectrum
SyHalf = abs(Y(1:NFFT/2 + 1));
SwHalf = Sw(1:NFFT/2 + 1);

% Save phase
yPhase = angle(Y(1:NFFT/2 + 1));

% Subtraction
SxHat = SyHalf - SwHalf; %Subtraction
SxHat = max(SxHat,0);  %Set negative values to zero

% Restore full spectrum
XHat(1:NFFT/2 + 1) = SxHat.*exp(1j*yPhase);
XHat(NFFT/2 + 2:NFFT) = conj(XHat(NFFT/2:-1:2));

end

