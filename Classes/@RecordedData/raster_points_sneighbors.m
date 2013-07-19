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