function plot_response_curves(spa0,channels,colors,GB)



%colors=dat.colors(1,:);
for i=1:size(spa0,1)
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    hf1=figure;
    set(hf1,'name',[GB ' abs response channel'  num2str(channels(i))],'numbertitle','off') 
    y=[spa0{i,1}(1) spa0{i,1}(2) spa0{i,2}(2) spa0{i,3}(2) spa0{i,4}(2)];
    x=[0 colors];
    plot(x,y,'ro');  
    
    hold on;
    
    xx=0:min(colors)/5:1;
    yy = spline ( x, y, xx );
    
    plot(xx,yy);
    xlabel('led intensity 0-1');
    ylabel('spikes/s');
    title([GB ' response curve abs ' 'channel' num2str(channels(i))]);
    print( hf1, '-djpeg', [GB ' response curve abs '  'Chan' num2str(channels(i)) '.jpg']); %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    hf2=figure;
    set(hf2,'name',[GB ' on response channel' num2str(channels(i))],'numbertitle','off')
    y=[spa0{i,1}(2)-spa0{i,1}(1) spa0{i,2}(2)-spa0{i,2}(1) spa0{i,3}(2)-spa0{i,3}(1) spa0{i,4}(2)-spa0{i,4}(1)];
    x=colors;
    plot(x,y,'ro'); 
    hold on;
    yy = spline ( x, y, xx );
    plot(xx,yy);
    
    xlabel('diff led intensity 0-1');
    ylabel('spikes/s');
    title([GB ' response curve on ' 'channel' num2str(channels(i))]);
    print( hf2, '-djpeg', [GB ' response curve on ' 'Chan' num2str(channels(i)) '.jpg']); %  
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    hf3=figure;
    set(hf3,'name',[GB ' off response channel' num2str(channels(i))],'numbertitle','off')
    y=[spa0{i,1}(3)-spa0{i,1}(2) spa0{i,2}(3)-spa0{i,2}(3) spa0{i,3}(3)-spa0{i,3}(2) spa0{i,4}(3)-spa0{i,4}(2)];
    x=colors;
    plot(x,y,'ro');  
    hold on;
    yy = spline ( x, y, xx );
    plot(xx,yy);
    
    xlabel('diff led intensity 0-1');
    ylabel('spikes/s');
    title([GB ' response curve off ' 'channel' num2str(channels(i))]);
    print( hf3, '-djpeg', [GB ' response curve off ' 'Chan' num2str(channels(i)) '.jpg']); %  
    
    
    
end
end