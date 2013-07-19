function y=generate_moving_bars_400_30fps(angle)
%120um/sec @30fps??
 
num_bars=800-30;
%bar set moving at 400umsec, 4
for i=1:num_bars %was 140
    in=3*i;
    bar=zeros(800); %square 160 pixels on one side
    bar(101:700,in:in+29)=ones(600,30); %draw bar
    bar=imrotate(bar,angle,'bilinear','crop'); %rotate bar
    
    %ba=bar(36:125,36:125); change this to modify image pixels, in this case assumes bar side = 90 
    ba=bar(201:600,201:600); % change this to modify image pixels, in this case assumes bar side = 96
    
R=0;
G=255;
B=255;

yr=R*ba;
yg=G*ba;
yb=B*ba;

yt=cat(3,yr,yg,yb);
    
    
    
    file_index=num2str(i+1000000)
    imwrite(yt,[ file_index(2:end) '.png'],'png');
end

y=i;
