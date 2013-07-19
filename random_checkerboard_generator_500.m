function y=random_checkerboard_generator_500
%begin=first frame number
%end= last frame number
%random_checkerboard_generator(n_frames,filename)



ind=16527;
for i=16527:36000
    zrn= randi([0,1],[50,50]);
    zrnn=kron(zrn,ones(10));
    zrr=zeros(500);
    zrn500=cat(3,zrr,zrnn,zrnn);
    file_index=num2str(ind+1000000);
    imwrite(zrn500,[ file_index(2:end) '.png'],'png');
    ind=ind+1
end