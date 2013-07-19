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