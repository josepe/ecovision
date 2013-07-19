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