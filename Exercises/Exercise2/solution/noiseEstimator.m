function SwHat = noiseEstimator(Yf, n, par, NFFT) 
%#codegen 
coder.inline('always');

persistent Tab
if isempty(Tab)
    Tab = zeros(NFFT, par.D);
end

% Estimate noise amplitude spectrum
Sy = abs(Yf);   

if n/2 - floor(n/2) == 0
    % replace highest amplitude values in Tab
    Tab(:,end) = Sy(:);
else
    % replace smallest amplitudes values in Tab
    Tab(:,1) = Sy(:);
end

% Sort in ascending order PSD values from last D frames
Tab = sort(Tab,2); 
SwHat = par.wOverEstGain*Tab(:,floor(par.q*par.D));