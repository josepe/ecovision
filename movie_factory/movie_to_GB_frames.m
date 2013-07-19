files=dir('*.tiff');
for k=1:length(files)
    if k==999
        a=2;
    end
    fnumber=files(k).name(3:end-5);
    fr=imread(files(k).name);
    fr2=fr(:,:,1:3);
    fr2(:,:,1)=zeros(size(fr2,1),size(fr2,2));
    findex=num2str(eval(fnumber)+10000000)
    file_index=findex(2:end)
    imwrite(fr2,[ file_index(2:end) '.png'],'png');
end