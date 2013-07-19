function out=filtering(in,fs)


tiempo=(0:length(in)-1)/fs;

% d = fdesign.bandpass('N,F3dB1,F3dB2',10,80,3e3,2e4);
% Hd = design(d,'butter');
% s_filtered = filtfilt(Hd.sosMatrix,Hd.ScaleValues,s_ne);
x=in;

%h=fdesign.lowpass('Fp,Fst,Ap,Ast',0.15,0.2,1,60);
hp=fdesign.lowpass('Fp,Fst,Ap,Ast',0.2,0.3,1,60);

bp = fdesign.bandpass('n,fc1,fc2', 10, 300, 3000, 20000);

d=design(hp,'equiripple'); %Lowpass FIR filter
out=filtfilt(d.Numerator,1,x); %zero-phase filtering

% h=fdesign.lowpass('N,F3dB',12,0.3);
% d1 = design(h,'butter');
% y = filtfilt(d1.sosMatrix,d1.ScaleValues,x);

% xplot=tiempo;
% yplot1=signal_ne/1000;
% yplot2=s_filtered/1000;
% 
% hf=figure;
% %subplot(2,1,1)
% plot(xplot,yplot1,'b',xplot,yplot2,'r');
% print( hf, '-djpeg', ['signal_filtered.jpg']); %

end