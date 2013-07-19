function y=generate_moving_bars_60fps(comienzo,num_bars,angle)
 
%no desarrollado
for i=1:num_bars %was 140
    in=i+9;
    bar=zeros(320); %square 320 pixels on one side
    bar(132:190,in:in+19)=ones(60,20); %draw bar
    bar=imrotate(bar,angle,'bilinear','crop'); %rotate bar
    
    %ba=bar(36:125,36:125); change this to modify image pixels, in this case assumes bar side = 90 
    ba=bar(33:128,33:128); % change this to modify image pixels, in this case assumes bar side = 96
    file_index=num2str(comienzo+i-1+1000000);
    imwrite(ba/1.5,[ file_index(2:end) '.png'],'png');
end

y=i+comienzo
file_index