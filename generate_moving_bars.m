function y=generate_moving_bars(comienzo)

for i=1:91
    bar=zeros(90);
    bar(31:60,i:i+8)=ones(30,9);
    
    file_index=num2str(comienzo+i+1000000);
    imwrite(bar/1.5,[ file_index(2:end) '.png'],'png');
end
    
    