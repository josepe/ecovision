%% SCRIPT TO PERFORM CINV DATA ANALYSIS
%{ 
The analysis here performed is just a test to improve the steps in
spike sorting algorithm, implemented on GUI in MATLAB and scripts in Python.

Here we play with CINV data that correspond to records of ganglion cell population
responses to RANDOM stimulus.

AASTUDILLO DIC2012
%}
%% LOAD RAW DATA FROM ASCII (VERY HEAVY STEP SO TAKE A BIG TIME!)
% PLEASE DONT USE, JUST SKIP
% you can skip this step and load single electrode files at the
% next blocks.

% load each part of blocks of data from ascii files (*.dat)
% the files was exported from spikeplayer data viewer (LABVIEW)
% the original files are an unknown file format binaries (*.spkdat)
d1=load('Joaquin_Araya_A_09-12-2012_Exp-1_15-07-23_part-0_export-0_bloques-0-50.dat');
d2=load('Joaquin_Araya_A_09-12-2012_Exp-1_15-07-23_part-0_export-1_bloques-51-100.dat');
d3=load('Joaquin_Araya_A_09-12-2012_Exp-1_15-07-23_part-0_export-2_bloques-101-150.dat');
d4=load('Joaquin_Araya_A_09-12-2012_Exp-1_15-07-23_part-0_export-3_bloques-151-200.dat');
d5=load('Joaquin_Araya_A_09-12-2012_Exp-1_15-07-23_part-0_export-4_bloques-201-250.dat');
d6=load('Joaquin_Araya_A_09-12-2012_Exp-1_15-07-23_part-0_export-5_bloques-251-300.dat');
d7=load('Joaquin_Araya_A_09-12-2012_Exp-1_15-07-23_part-0_export-6_bloques-301-384.dat');

d8=load('Joaquin_Araya_A_09-12-2012_Exp-1_15-07-23_part-1_export-0_bloques-0-50.dat');
d9=load('Joaquin_Araya_A_09-12-2012_Exp-1_15-07-23_part-1_export-1_bloques-51-100.dat');
d10=load('Joaquin_Araya_A_09-12-2012_Exp-1_15-07-23_part-1_export-2_bloques-101-150.dat');
d11=load('Joaquin_Araya_A_09-12-2012_Exp-1_15-07-23_part-1_export-3_bloques-151-200.dat');
d12=load('Joaquin_Araya_A_09-12-2012_Exp-1_15-07-23_part-1_export-4_bloques-201-250.dat');
d13=load('Joaquin_Araya_A_09-12-2012_Exp-1_15-07-23_part-1_export-5_bloques-251-300.dat');
d14=load('Joaquin_Araya_A_09-12-2012_Exp-1_15-07-23_part-1_export-6_bloques-301-384.dat');

d15=load('Joaquin_Araya_A_09-12-2012_Exp-1_15-07-23_part-2_export-0_bloques-0-50.dat');
d16=load('Joaquin_Araya_A_09-12-2012_Exp-1_15-07-23_part-2_export-1_bloques-51-100.dat');
d17=load('Joaquin_Araya_A_09-12-2012_Exp-1_15-07-23_part-2_export-2_bloques-101-150.dat');
d18=load('Joaquin_Araya_A_09-12-2012_Exp-1_15-07-23_part-2_export-3_bloques-151-200.dat');
d19=load('Joaquin_Araya_A_09-12-2012_Exp-1_15-07-23_part-2_export-4_bloques-201-250.dat');
d20=load('Joaquin_Araya_A_09-12-2012_Exp-1_15-07-23_part-2_export-5_bloques-251-300.dat');
d21=load('Joaquin_Araya_A_09-12-2012_Exp-1_15-07-23_part-2_export-6_bloques-301-384.dat');poiqw>

d22=load('Joaquin_Araya_A_09-12-2012_Exp-1_15-07-23_part-3_export-0_bloques-0-50.dat');
d23=load('Joaquin_Araya_A_09-12-2012_Exp-1_15-07-23_part-3_export-1_bloques-51-100.dat');
d24=load('Joaquin_Araya_A_09-12-2012_Exp-1_15-07-23_part-3_export-2_bloques-101-150.dat');
d25=load('Joaquin_Araya_A_09-12-2012_Exp-1_15-07-23_part-3_export-3_bloques-151-200.dat');
d26=load('Joaquin_Araya_A_09-12-2012_Exp-1_15-07-23_part-3_export-4_bloques-201-250.dat');
d27=load('Joaquin_Araya_A_09-12-2012_Exp-1_15-07-23_part-3_export-5_bloques-251-300.dat');
d28=load('Joaquin_Araya_A_09-12-2012_Exp-1_15-07-23_part-3_export-6_bloques-301-350.dat');


%% CHOOSE ONE ELECTRODE CHANNEL SIGNAL AND SAVE (SKIP)

ne=40;

signal_ne=[d1(:,ne); d2(:,ne); d3(:,ne); d4(:,ne); d5(:,ne); d6(:,ne); d7(:,ne);...
    d8(:,ne); d9(:,ne); d10(:,ne); d11(:,ne); d12(:,ne); d13(:,ne); d14(:,ne);...
    d15(:,ne); d16(:,ne); d17(:,ne); d18(:,ne); d19(:,ne); d20(:,ne); d21(:,ne);...
    d22(:,ne); d23(:,ne); d24(:,ne); d25(:,ne); d26(:,ne); d27(:,ne); d28(:,ne) ];

s_ne=signal_ne(1:6000000);
save('signal_e39_5min.mat','s_ne');

%% loop for save all individual channels (SKIP)
for ka=1:size(d1,2);
    ne=ka;
    signal_ne=[d1(:,ne); d2(:,ne); d3(:,ne); d4(:,ne); d5(:,ne); d6(:,ne); d7(:,ne);...
    d8(:,ne); d9(:,ne); d10(:,ne); d11(:,ne); d12(:,ne); d13(:,ne); d14(:,ne);...
    d15(:,ne); d16(:,ne); d17(:,ne); d18(:,ne); d19(:,ne); d20(:,ne); d21(:,ne);...
    d22(:,ne); d23(:,ne); d24(:,ne); d25(:,ne); d26(:,ne); d27(:,ne); d28(:,ne) ];
    filename=['signal_e',num2str(ka-1),'.mat'];
    save(filename,'signal_ne');
end

%% LOAD AND SHOW ONE SINGLE ELECTRODE SIGNAL

electrode_n=39;

load signal_e39.mat
hf=figure; 
plot(signal_ne/1000)
ylabel('Amplitude uV');
xlabel('points');
title('Raw signal in electrode');

print( hf, '-djpeg', ['signal.jpg']); %

%% FILTERING

fs=20000;
tiempo=(0:length(signal_ne)-1)/fs;

% d = fdesign.bandpass('N,F3dB1,F3dB2',10,80,3e3,2e4);
% Hd = design(d,'butter');
% s_filtered = filtfilt(Hd.sosMatrix,Hd.ScaleValues,s_ne);
x=signal_ne;

%h=fdesign.lowpass('Fp,Fst,Ap,Ast',0.15,0.2,1,60);
hp=fdesign.lowpass('Fp,Fst,Ap,Ast',0.2,0.3,1,60);

bp = fdesign.bandpass('n,fc1,fc2', 10, 300, 3000, 20000);

d=design(hp,'equiripple'); %Lowpass FIR filter
s_filtered=filtfilt(d.Numerator,1,x); %zero-phase filtering

% h=fdesign.lowpass('N,F3dB',12,0.3);
% d1 = design(h,'butter');
% y = filtfilt(d1.sosMatrix,d1.ScaleValues,x);

xplot=tiempo;
yplot1=signal_ne/1000;
yplot2=s_filtered/1000;

hf=figure;
%subplot(2,1,1)
plot(xplot,yplot1,'b',xplot,yplot2,'r');
print( hf, '-djpeg', ['signal_filtered.jpg']); %

%% NEO FILTER :
x=signal_ne;
phi_x = zeros(size(x,1),size(x,2));
for k = 2:length(x)-1
    phi_x(k) = x(k)^2-x(k-1)*x(k+1);
end

%% plot neo filter
xplot=tiempo;
yplot1=signal_ne/1000;
yplot2=s_filtered/1000;
yplot3=phi_x/1000;

hf=figure;
subplot(2,1,1)
plot(xplot,yplot1,'b',xplot,yplot2,'r');
subplot(2,1,2)
plot(xplot,yplot1,'b',xplot,yplot3,'r');
print( hf, '-djpeg', ['signal_filtered_NEO.jpg']); %


%% electrode map CINV (25 SEPT ANALYSIS)
%#CINV electrode index map 25 sept
%#se n1 n2 n3 n4

%electrodemap = [ se  n1  n2  n3  n4
electrode_map = [ 22, 24, 25, 20, 21 ;...
                  25, 26, 30, 23, 22 ;...
                  30, 29, 31, 28, 25 ;...
                  31, 32, 36, 33, 30 ;...
                  36, 35, 39, 38, 31 ;...
                  39, 37, 40, 41, 36 ;...
                  20, 22, 23, 17, 19 ;...
                  23, 25, 28, 18, 20 ;...
                  28, 30, 33, 27, 23 ;...
                  33, 31, 38, 34, 28 ;...
                  38, 36, 41, 43, 33 ;...
                  41, 39, 42, 44, 38 ;...
                  17, 20, 18, 14, 16 ;...
                  18, 23, 27, 13, 17 ;...
                  27, 28, 34,  4, 18 ;...
                  34, 33, 43, 57, 27 ;...
                  43, 38, 44, 48, 34 ;...
                  44, 41, 45, 47, 43 ;...
                  14, 17, 13, 11, 15 ;...
                  13, 18,  4,  8, 14 ;...
                  04, 27, 57,  3, 13 ;...
                  57, 34, 48, 58,  4 ;...
                  48, 43, 47, 53, 57 ;...
                  47, 44, 46, 50, 48 ;...
                  11, 14,  8,  9, 12 ;...
                   8, 13,  3,  6, 11 ;...
                  03,  4, 58,  1,  8 ;...
                  58, 57, 53, 60,  3 ;...
                  53, 48, 50, 55, 58 ;...
                  50, 47, 49, 52, 53 ;...
                   9, 11,  6,  7, 10 ;...
                   6,  8,  1,  5,  9 ;...
                   1,  3, 60,  2,  6 ;...
                  60, 58, 55, 59,  1 ;...
                  55, 53, 52, 56, 60 ;...
                  52, 50, 51, 54, 55 ];

pos=find(electrode_map(:,1)==electrode_n);
neigh=electrode_map(pos,2:5);
              
              
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


%% get spikes
% load('signal_e39_5min.mat'); %,'s_ne'

umbral=5*median(abs(s_filtered/1000)/0.6745);

pos=find(abs(s_filtered/1000)>umbral);

kk=1;
spikestamp=[];

stamp_anterior=0;
tiempo_rechazo = 2; %tiempo rechazo interspike para deteccion, 2ms
tpo_rechazo_pts = 2 / 1000 * fs;

for k=1:length(pos);
    valor=abs(s_filtered(pos(k)));
    anterior=abs(s_filtered(pos(k)-1));
    posterior=abs(s_filtered(pos(k)+1));
    
    if (valor>anterior)&(valor>posterior)&(pos(k)>(tpo_rechazo_pts+stamp_anterior))
        spikestamp(kk)=pos(k);
        kk=kk+1;
        stamp_anterior=pos(k);
    end
        
    %if (abs(s_ne(pos(k))/1000)>abs(s_ne(pos(k)-1)))&&(abs(s_ne(pos(k))/1000)>abs(s_ne(pos(k)+1)))
%     if ((s_ne(pos(k))/1000)>(s_ne(pos(k)-1)))&&((s_ne(pos(k))/1000)>(s_ne(pos(k)+1)))
%         spikestamp(kk)=pos(k);
%         kk=kk+1;
%     end    
end

%% plot detected spikes in filtered signal

xplot=tiempo;
yplot=s_filtered/1000;

hf=figure;
subplot(2,1,1)
plot(xplot,yplot);

hold on
plot(spikestamp/fs,yplot(spikestamp),'ro');
hold off

title('filtered signals');
xlabel('Time in sec');
ylabel('Amplitude uV');

subplot(2,1,2)
plot(xplot,abs(yplot));
hold on
plot(spikestamp/fs,abs(yplot(spikestamp)),'ro');
hold off
% intervalo=1;
% set(gca,'Xtick',tiempo(tiempo_to_show_points(1))/1000:intervalo:tiempo(tiempo_to_show_points(2))/1000)
print( hf, '-djpeg', ['signal_spikes.jpg']); %



%% GET SPIKES IN TIME WINDOWS: get the waveforms

wrange_time=2; %windows range in msec
wrange_points=wrange_time/1000*fs;
wp_inicial=round(wrange_points/2);
wp_final=round(wrange_points/2);

%generate the spikelist
spikelist=zeros(length(spikestamp),wrange_points);

numneigh=4; %number of neighbors

spikeneighborlist=zeros(length(spikestamp),wrange_points*numneigh);

for k=1:length(spikestamp)
    spikelist(k,:)=s_filtered(spikestamp(k)-wp_inicial:spikestamp(k)+wp_final-1);
    spikeneighborlist(k,:)=[e1f(spikestamp(k)-wp_inicial:spikestamp(k)+wp_final-1);...
                            e2f(spikestamp(k)-wp_inicial:spikestamp(k)+wp_final-1);...
                            e3f(spikestamp(k)-wp_inicial:spikestamp(k)+wp_final-1);...
                            e4f(spikestamp(k)-wp_inicial:spikestamp(k)+wp_final-1) ];

end

%% plot detected waveforms (only seed electrode)
xplot=(0:wrange_points-1)/fs*1000; %time in msec

hf=figure;
hold on
for k=1:length(spikestamp)
    yplot=spikelist(k,:)/1000;
    plot(xplot,yplot)
end
ylabel('Amplitude uV')
xlabel('Time ms')
print( hf, '-djpeg', ['spikes_.jpg']); %

%% plot detected waveforms in seed and neighor electrodes
spk_all=[spikelist, spikeneighborlist];

xplot=(0:size(spk_all,2)-1)/fs*1000; %time in msec

hf=figure;

subplot(2,1,1);
hold on
for k=1:length(spikestamp)
    yplot=spk_all(k,:)/1000;
    plot(xplot,yplot)
end
ylabel('Amplitude uV')
xlabel('Time ms')
print( hf, '-djpeg', ['spikes_seed_neigh_.jpg']); %


%% feature extraction (only seed)
[pc,scores,latent,tsquare] = princomp(spikelist/1000);
%[coefs,scores,variances,t2]

hf=figure;
h1=axes;
plot(scores(:,1),scores(:,2),'+');
title('Features PCA (seed)');
xlabel('PC1');
ylabel('PC2');
grid
print( hf, '-djpeg', ['pca.jpg']); %

%% feature extraction (seed+neighbors)
[pc2,scores2,latent2,tsquare2] = princomp(spk_all/1000);
%[coefs,scores,variances,t2]

hf=figure;
h1=axes;
plot(scores2(:,1),scores2(:,2),'+');
title('Features PCA (seed neigh)');
xlabel('PC1');
ylabel('PC2');
grid
print( hf, '-djpeg', ['pca_seed_neigh.jpg']); %

%% clustering (only seed)
hf=figure;
h1=subplot(2,2,1);
%h1=axes;
plot(scores(:,1),scores(:,2),'+');
title('Features PCA');
xlabel('PC1');
ylabel('PC2');

% axes(handles.axes4);
xlimits=get(h1,'Xlim');
ylimits=get(h1,'Ylim');

X=scores(:,1:2);

options = statset('Display','final');
numcluster=4;
obj = gmdistribution.fit(X,numcluster,'Options',options);

%figure,
hold on;
scatter(X(:,1),X(:,2),10,'.')
%hold on
h = ezcontour(@(x,y)pdf(obj,[x y]),xlimits,ylimits);
%hold off;

idx = cluster(obj,X);

colores='rgmyb';


% for kc=1:numcluster
%     cluster1 = X(idx == k,:);
%     hold on;
%     hs = scatter(cluster1(:,1),cluster1(:,2),10,'Marker','x','MarkerEdgeColor',colores(kc),'MarkerFaceColor',colores(kc)); 
%     hold off
% end
% grid

cluster1 = X(idx == 1,:);
cluster2 = X(idx == 2,:);
cluster3 = X(idx == 3,:);
cluster4 = X(idx == 4,:);

hold on;
h1 = scatter(cluster1(:,1),cluster1(:,2),10,'r+');
h2 = scatter(cluster2(:,1),cluster2(:,2),10,'g+');
h2 = scatter(cluster3(:,1),cluster3(:,2),10,'m+');
h2 = scatter(cluster4(:,1),cluster4(:,2),10,'y+');
hold off
grid
%legend([h1 h2],'Cluster 1','Cluster 2','Location','NW')

%print( hf, '-djpeg', ['signal_spikes.jpg']); %
%%
%
xplot=(0:wrange_points-1)/fs*1000; %time in msec
subplot(2,2,2);
hold on
for k=1:length(spikestamp)
    yplot=spikelist(k,:)/1000;
    plot(xplot,yplot,colores(idx(k)))
end
ylabel('Amplitude uV')
xlabel('Time ms')

%%
subplot(2,2,3:4)

xplot=tiempo;
yplot=s_filtered/1000;

% figure,
% subplot(2,1,1)
plot(xplot,yplot);
hold on
% plot(spikestamp/fs,yplot(spikestamp),'r.');

for k=1:length(spikestamp)
%     yplot=spikelist(k,:)/1000;
%     plot(xplot,yplot,colores(idx(k)))
    plot(spikestamp(k)/fs,yplot(spikestamp(k)),colores(idx(k)),'Marker','o');
end

hold off

title('filtered signals');
xlabel('Time in sec');
ylabel('Amplitude uV');

print( hf, '-djpeg', ['cluster_signal.jpg']); %

%% clustering (seed and neighbors electrode)
hf=figure;
h1=subplot(4,4,[1 2, 5 6]);
plot(scores2(:,1),scores2(:,2),'+');
title('Features PCA');
xlabel('PC1');
ylabel('PC2');

xlimits=get(h1,'Xlim');
ylimits=get(h1,'Ylim');

X2=scores2(:,1:2);
options2 = statset('Display','final');
numcluster=4;
obj2 = gmdistribution.fit(X2,numcluster,'Options',options2);

hold on;
scatter(X2(:,1),X2(:,2),10,'.')
h = ezcontour(@(x,y)pdf(obj2,[x y]),xlimits,ylimits);

idx2 = cluster(obj2,X2);

colores='rgmyb';

cluster1_2 = X2(idx2 == 1,:);
cluster2_2 = X2(idx2 == 2,:);
cluster3_2 = X2(idx2 == 3,:);
cluster4_2 = X2(idx2 == 4,:);

hold on;
h1 = scatter(cluster1_2(:,1),cluster1_2(:,2),10,'r+');
h2 = scatter(cluster2_2(:,1),cluster2_2(:,2),10,'g+');
h2 = scatter(cluster3_2(:,1),cluster3_2(:,2),10,'m+');
h2 = scatter(cluster4_2(:,1),cluster4_2(:,2),10,'y+');
hold off
grid

%

xplot=(0:wrange_points*5-1)/fs*1000; %time in msec
subplot(4,4,9:12);
hold on
for k=1:length(spikestamp)
    yplot=spk_all(k,:)/1000;
    plot(xplot,yplot,colores(idx2(k)))
end
ylabel('Amplitude uV')
xlabel('Time ms')
grid;

% ------------------

subplot(4,4,13:16);

xplot=tiempo;
yplot=s_filtered/1000;

% figure,
% subplot(2,1,1)
plot(xplot,yplot);
hold on
% plot(spikestamp/fs,yplot(spikestamp),'r.');

for k=1:length(spikestamp)
%     yplot=spikelist(k,:)/1000;
%     plot(xplot,yplot,colores(idx(k)))
    plot(spikestamp(k)/fs,yplot(spikestamp(k)),colores(idx2(k)),'Marker','o');
end

hold off

title('filtered signals');
xlabel('Time in sec');
ylabel('Amplitude uV');
grid;

%print( hf, '-djpeg', ['cluster_signal_seed_neigh.jpg']); %

% templates
xplot=(0:wrange_points-1)/fs*1000; %time in msec
template1=mean(spk_all(idx2==1,1:wrange_points)/1000);
template2=mean(spk_all(idx2==2,1:wrange_points)/1000);
template3=mean(spk_all(idx2==3,1:wrange_points)/1000);
template4=mean(spk_all(idx2==4,1:wrange_points)/1000);


subplot(4,4,3);
plot(xplot,template1,colores(1),'LineWidth',2);
ylabel('Amplitude uV');
xlabel('Time ms');
grid

subplot(4,4,4);
plot(xplot,template2,colores(2),'LineWidth',2);
ylabel('Amplitude uV');
xlabel('Time ms');
grid

subplot(4,4,7);
plot(xplot,template3,colores(3),'LineWidth',2);
ylabel('Amplitude uV');
xlabel('Time ms');
grid

subplot(4,4,8);
plot(xplot,template4,colores(4),'LineWidth',2);
ylabel('Amplitude uV');
xlabel('Time ms');
grid

print( hf, '-djpeg', ['cluster_signal_seed_neigh.jpg']); %

%% templates (only seed)
% cluster1 = X(idx == 1,:);
% cluster2 = X(idx == 2,:);
% cluster3 = X(idx == 3,:);
% cluster4 = X(idx == 4,:);
xplot=(0:wrange_points-1)/fs*1000; %time in msec
template1=mean(spikelist(idx==1,:)/1000);
template2=mean(spikelist(idx==2,:)/1000);
template3=mean(spikelist(idx==3,:)/1000);
template4=mean(spikelist(idx==4,:)/1000);

hf=figure;
subplot(2,2,1);
plot(xplot,template1,colores(1),'LineWidth',2);
ylabel('Amplitude uV');
xlabel('Time ms');
grid

subplot(2,2,2);
plot(xplot,template2,colores(2),'LineWidth',2);
ylabel('Amplitude uV');
xlabel('Time ms');
grid

subplot(2,2,3);
plot(xplot,template3,colores(3),'LineWidth',2);
ylabel('Amplitude uV');
xlabel('Time ms');
grid

subplot(2,2,4);
plot(xplot,template4,colores(4),'LineWidth',2);
ylabel('Amplitude uV');
grid
xlabel('Time ms');

print( hf, '-djpeg', ['templates.jpg']); %

%% templates (seed + neighbors)
% cluster1 = X(idx == 1,:);
% cluster2 = X(idx == 2,:);
% cluster3 = X(idx == 3,:);
% cluster4 = X(idx == 4,:);
xplot=(0:wrange_points-1)/fs*1000; %time in msec
template1=mean(spikelist(idx2==1,:)/1000);
template2=mean(spikelist(idx2==2,:)/1000);
template3=mean(spikelist(idx2==3,:)/1000);
template4=mean(spikelist(idx2==4,:)/1000);

hf=figure;
subplot(2,2,1);
plot(xplot,template1,colores(1),'LineWidth',2);
ylabel('Amplitude uV');
xlabel('Time ms');
grid

subplot(2,2,2);
plot(xplot,template2,colores(2),'LineWidth',2);
ylabel('Amplitude uV');
xlabel('Time ms');
grid

subplot(2,2,3);
plot(xplot,template3,colores(3),'LineWidth',2);
ylabel('Amplitude uV');
xlabel('Time ms');
grid

subplot(2,2,4);
plot(xplot,template4,colores(4),'LineWidth',2);
ylabel('Amplitude uV');
grid
xlabel('Time ms');

print( hf, '-djpeg', ['templates.jpg']); %

%% raster lineas

hf=figure;
%plot(spikestamp/fs*1000,idx,'b.','MarkerSize',1);

%
hold on
for k=1:length(spikestamp)
    x=spikestamp(k)/fs*1000;
    y=[idx(k) idx(k)+0.5];
    line([x x],[y(1) y(2)],'Color',colores(idx(k)));
end
hold off

x=get(gca,'Xlim');
y=get(gca,'Ylim');

axis([x(1) x(2) 0 5]) % see only 100 cells

xlabel('Time ms');
ylabel('# Cell');
title('Raster Plot 1');
%set(gca,'Xtick',[0 max(t(1:t2show))]);
%set(gca,'Ytick',[0 cells2show]);
grid;
print( hf, '-djpeg', ['raster.jpg']); %



%% raster puntos (only seed)

hf=figure;
%plot(spikestamp/fs*1000,idx,'b.','MarkerSize',1);

%
hold on
for k=1:length(spikestamp)
    xplot=spikestamp(k)/fs/60; 
    yplot=[idx(k) idx(k)+0.5];
    %line([xplot xplot],[yplot(1) yplot(2)],'Color',colores(idx(k)));
    
    plot(spikestamp(k)/fs*1000,idx(k),colores(idx(k)),'Marker','s','MarkerSize',2,'MarkerFaceColor',colores(idx(k)));
end
hold off

x=get(gca,'Xlim');
y=get(gca,'Ylim');

axis([x(1) x(2) 0 5]) % see only 100 cells

xlabel('Time min');
ylabel('# Cell');
title('Raster Plot 1');
%set(gca,'Xtick',[0 max(t(1:t2show))]);
set(gca,'Ytick',(0:x(2)));
grid;
print( hf, '-djpeg', ['raster_dots.jpg']); %

%% raster puntos (seed + neighbors)

hf=figure;
%plot(spikestamp/fs*1000,idx,'b.','MarkerSize',1);
%
hold on
for k=1:length(spikestamp)
    xplot=spikestamp(k)/fs/60; 
    yplot=[idx2(k) idx2(k)+0.5];
    %line([xplot xplot],[yplot(1) yplot(2)],'Color',colores(idx(k)));
    
    plot(spikestamp(k)/fs*1000,idx2(k),colores(idx2(k)),'Marker','s','MarkerSize',2,'MarkerFaceColor',colores(idx2(k)));
end
hold off

x=get(gca,'Xlim');
y=get(gca,'Ylim');

axis([x(1) x(2) 0 5]) % see only 100 cells

xlabel('Time min');
ylabel('# Cell');
title('Raster Plot 1');
%set(gca,'Xtick',[0 max(t(1:t2show))]);
set(gca,'Ytick',(0:x(2)));
grid;
print( hf, '-djpeg', ['raster_dots.jpg']); %