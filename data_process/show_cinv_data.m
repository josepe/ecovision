%Script to load data from MEA system records, exported data from SPH and show
%ABAC JA 2012


%% Loading DATA
% load data:
data=load('C:/Users/ecovision/Desktop/solo dato 5,2 intensidad con ames/Joaquin_Araya_A_30-08-2012_Exp-3_17-29-02_part-0_export-0_bloques-0-254.dat');

%% Configuration parameters

%get size in number of points and number of electrodes:
[n_puntos,n_electrodos]=size(data);

%define sampling frequency:
freq_samp=20000;

%take only electrodes data, and drop the first column because 
%first column are time stamps:
data2=data(:,2:61);

%define a time vector for plot (in msec)
tiempo=(0:n_puntos-1)/freq_samp*1000;

%define what electrodes show and analize:
electrodes_to_show = [ 1 3 5 ]; %index of electrode channel to show

%define a time windows to show:
tiempo_to_show = [1000 1500]; %windows time in msec to show

%convert windows time to windows points:
tiempo_to_show_points = tiempo_to_show/1000*freq_samp+1;

%% Filtering

%Filter 1:
h=fdesign.highpass('N,F3dB',12,0.15);
d1 = design(h,'butter');
data2_filt = filtfilt(d1.sosMatrix,d1.ScaleValues,data2(:,electrodes_to_show(1)));

%Filter2:
%Design an IIR Butterworth filter of order 10 with 3–dB frequencies of 300Hz and 
%3kHz. The sampling frequency is 20 kHz
filter_order=10;
freq1=300; %Hz
freq2=3000; %Hz
d = fdesign.bandpass('N,F3dB1,F3dB2',filter_order,freq1,freq2,freq_samp); %initializes the filter
Hd = design(d,'butter'); %creates the filter butterworth

%apply the filter on signal:
data2_filt2 = filtfilt(Hd.sosMatrix,Hd.ScaleValues,data2(:,electrodes_to_show(1)));


%WHAT IS IT MOTHER FUCKERSSSSSS!!!!!!

%% Thresholding for spike detection

%...

%% Graphics ploting figures 

%define a scale factor for correcting amplitudes
ampli_factor=1/1000;

figure(1), 
subplot(2,1,1)
plot(tiempo(tiempo_to_show_points(1):tiempo_to_show_points(2)),ampli_factor*data2(tiempo_to_show_points(1):tiempo_to_show_points(2),electrodes_to_show(1)));
hold on
plot(tiempo(tiempo_to_show_points(1):tiempo_to_show_points(2)),ampli_factor*data2_filt2(tiempo_to_show_points(1):tiempo_to_show_points(2),electrodes_to_show(1)),'r');
hold off
title('Raw signal electrode');
xlabel('Time in msec');
ylabel('Amplitude mV');
legend('raw data','filtered data');

%% fft:

datafurier    = fft(ampli_factor*data2(tiempo_to_show_points(1):tiempo_to_show_points(2),electrodes_to_show(1)));
datafurierabs = abs(datafurier);
frecuencia    = (0:length(datafurier)-1)*freq_samp/(length(datafurier)-1);

data_filt_furier = fft(ampli_factor*data2_filt2(tiempo_to_show_points(1):tiempo_to_show_points(2),electrodes_to_show(1)));
data_filt_furier_abs=abs(data_filt_furier);

subplot(2,1,2)
stem(frecuencia(1:round(length(datafurierabs)/2)),datafurierabs(1:round(length(datafurierabs)/2)));
hold on
stem(frecuencia(1:round(length(datafurierabs)/2)),data_filt_furier_abs(1:round(length(datafurierabs)/2)),'r');
hold off
title('FFT Raw signal electrode');
xlabel('Frequency in Hz');
ylabel('Magnitude');
legend('raw data','filtered data');

%%  Compare frequencies in time windows areas 

w1 = [ 200 250 ]/1000*freq_samp+1; %windows in msec
w2 = [ 350 400 ]/1000*freq_samp+1; %windows in msec

d1 = ampli_factor*data2_filt2(w1(1):w1(2),electrodes_to_show(1)); %get time windows data
d2 = ampli_factor*data2_filt2(w2(1):w2(2),electrodes_to_show(1)); %get time windows data

f1 = fft(d1); %fast fourier transform result in complex vector
f2 = fft(d2);

fa1 = abs(f1); %get absolute value of complex vector
fa2 = abs(f2);

%define frequency vector for show
frecuencia2=(0:length(f1)-1)*freq_samp/(length(f1)-1); 
mitad=round(length(f1)/2); %get the middle part because fft is simetric

%calculate the differences between absolutes values vector:
diferencia=abs(fa1-fa2);

%plots:
figure(2),
subplot(2,1,1);
stem(frecuencia2(1:mitad),fa1(1:mitad));
title('FFT signal in two time windows');
xlabel('Frequency in Hz');
ylabel('Magnitude');
hold on
stem(frecuencia2(1:mitad),fa2(1:mitad),'r');
hold off
legend('time windows 1','time windows 2');

subplot(2,1,2);
stem(frecuencia2(1:mitad),diferencia(1:mitad),'r','Marker','square');
title('FFT error between signals in windows');
xlabel('Frequency in Hz');
ylabel('Magnitude');
