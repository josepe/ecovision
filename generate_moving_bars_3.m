function y=generate_moving_bars_3(comienzo,num_bars,angle)
 
for i=1:num_bars %was 140
    in=5*i;
    bar=zeros(1000); %square 160 pixels on one side
    bar(101:900,in:in+39)=ones(800,40); %draw bar
    bar=imrotate(bar,angle,'bilinear','crop'); %rotate bar
    
    %ba=bar(36:125,36:125); change this to modify image pixels, in this case assumes bar side = 90 
    ba=bar(101:900,101:900); % change this to modify image pixels, in this case assumes bar side = 96
    
R=0;
G=255;
B=255;

yr=R*ba;
yg=G*ba;
yb=B*ba;

yt=cat(3,yr,yg,yb);
    
    
    
    file_index=num2str(comienzo+i-1+1000000);
    imwrite(yt,[ file_index(2:end) '.jpg'],'jpg');
end

y=i+comienzo
file_index