function y=generate_moving_bars_600px(comienzo,num_bars,angle)
 
%to be used at 600px resol (3.5um/px)
% bar speed = 300um/sec = 90px/sec
% dimensiones 300umx100um ~ 90x30px

for i=1:num_bars %was 140
    in=i+30;
    bar=zeros(800); %square 800 pixels on one side (to be cropped to 600px later)
    bar(355:355+90,in:in+30)=ones(90,30); %draw bar CORRECT NUMBER OF PIXELS ADVANCED BY FRAME TO GET CORRECT SPEED
    bar=imrotate(bar,angle,'bilinear','crop'); %rotate bar
    
    %ba=bar(36:125,36:125); change this to modify image pixels, in this case assumes bar side = 90 
    ba=bar(101:600,101:600); % change this to modify image pixels, in this case assumes bar side = 96
    file_index=num2str(comienzo+i-1+1000000);
    imwrite(ba/1.5,[ file_index(2:end) '.png'],'png');
end

y=i+comienzo
file_index