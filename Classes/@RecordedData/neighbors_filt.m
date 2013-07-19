%% load neighbors signal and filtering
%load neighbors
%for electrode 39:
%39,: 37, 40, 41, 36 ;...
load('signal_e37.mat');
e1 = signal_ne;
load('signal_e40.mat');
e2 = signal_ne;
load('signal_e41.mat');
e3 = signal_ne;
load('signal_e36.mat');
e4 = signal_ne;


e1f = filtfilt(d.Numerator,1,e1); %zero-phase filtering
e2f = filtfilt(d.Numerator,1,e2); %zero-phase filtering
e3f = filtfilt(d.Numerator,1,e3); %zero-phase filtering
e4f = filtfilt(d.Numerator,1,e4); %zero-phase filtering