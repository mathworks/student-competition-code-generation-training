%% Find EXE file and delete for forcing regeneration

% Copyright 2018 The MathWorks, Inc.

clc
close all
exeStr = which('controllerSoln.exe');
if(~isempty(exeStr))
    delete(exeStr)
end

%% Look for generated code folder, if not generate code
csolncgfolder = exist('controllerSoln_ert_rtw', 'dir');

if(csolncgfolder ~= 7)
    load_system('controllerSoln');
    rtwbuild('controllerSoln');
end

%% Replace example main with custom main
currFolder = cd('controllerSoln_ert_rtw');
copyfile([currFolder '\my_main\ert_main.c']) 

%% Delete OBJ files to force regeneration
delete('*.obj');

%% Run batch file to compile and build new executable
!controllerSoln.bat

%% Run executable
cd(currFolder)
!controllerSoln.exe

%% Load MAT file and plot results
load('controllerSoln.mat')
plot(rt_tout, rt_yout)