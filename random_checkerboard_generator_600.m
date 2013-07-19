function y=random_checkerboard_generator_600
%begin=first frame number
%end= last frame number
%random_checkerboard_generator(n_frames,filename)



ind=1;
for i=1:36000
    zrn= randi([0,1],[60,60]);
    zrnn=kron(zrn,ones(10));
    zrr=zeros(600);
    zrn600=cat(3,zrr,zrnn,zrnn);
    file_index=num2str(ind+1000000);
    imwrite(zrn600,[ file_index(2:end) '.png'],'png');
    ind=ind+1
end
