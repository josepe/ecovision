function imseries=im_stack(folder,range,sample,channel)

cd(folder);
di=dir('*.png');
% zinit=imread(di(range(1)).name);
% zp=zinit(sample,sample,channel);
m=length(sample);
imseries=zeros(m,m,length(range));
for i=range
    i
    z=imread(di(i).name);
    zp=z(sample,sample,channel);
    imseries(:,:,i)=zp>0;
end