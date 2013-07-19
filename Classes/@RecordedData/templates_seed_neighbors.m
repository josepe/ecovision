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