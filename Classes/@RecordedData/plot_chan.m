%% LOAD AND SHOW ONE SINGLE ELECTRODE SIGNAL

electrode_n=39;

load signal_e39.mat
hf=figure; 
plot(signal_ne/1000)
ylabel('Amplitude uV');
xlabel('points');
title('Raw signal in electrode');

print( hf, '-djpeg', ['signal.jpg']); %