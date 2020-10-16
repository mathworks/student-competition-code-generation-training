% Declare a1 and b0 variables as Simulink.Parameter variables
% and set storage class to 'ExportedGlobal'

a1 = Simulink.Parameter(0.9);
a1.CoderInfo.StorageClass = 'ExportedGlobal';
b0 = Simulink.Parameter(0.1);
b0.CoderInfo.StorageClass = 'ExportedGlobal';