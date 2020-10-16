% Copyright 2018 The MathWorks, Inc.

% Motor Parameters
J = 3.228E-6;    %kg*m^2
b = 3.508E-5;    %N*m/(rad/s)
K = 2.740E-4;    %V/(rad/s) = N*m/A
R = 4;           %Ohms
L = 2.750E-5;    %H

% Controller Parameters
Kp = 1;        %Proportional gain
Ki = 0;         %Integral gain
Kd = 0;         %Derivative gain
Ts = 0.01;      %Sample time
Fc = 100;       %Filter