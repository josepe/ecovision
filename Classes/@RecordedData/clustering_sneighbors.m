

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

