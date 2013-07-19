function [outdata,outsync]=readdata_dir(in,channels,number_of_blocks,points_per_block)


data1=zeros(points_per_block*number_of_blocks,length(channels));
datsync=zeros(points_per_block*number_of_blocks,1);
loc=1;
for k=1:length(in)
    
    st=importdata(in(k).name);
    zi=size(st);
    data1(loc:loc+zi(1)-1,1:length(channels))= st(:,channels);
    datsync(loc:loc+zi(1)-1)= st(:,65);
    loc=loc+zi(1);
    
end
outdata=data1;
outsync=datsync;
end