% Copyright 2018 The MathWorks, Inc.

% Motor Parameters
J = 3.228E-6;    %kg*m^2
b = 3.508E-5;    %N*m/(rad/s)
K = 2.740E-4;    %V/(rad/s) = N*m/A
R = 4;           %Ohms
L = 2.750E-5;    %H

% Controller Parameters
Kp = 0.3054;        %Proportional gain
Ki = 0.0810;        %Integral gain
Kd = 0.0230;        %Derivative gain
Ts = 0.01;          %Sample time
Fc = 58.9580; %Filter

% Load Input Signals for testing controller
load testData.mat