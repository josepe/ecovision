function y=random_checkerboard_generator_400
%begin=first frame number
%end= last frame number
%random_checkerboard_generator(n_frames,filename)



ind=1;
for i=1:15000
    zrn= randi([0,1],[40,40]);
    zrn400=kron(zrn,ones(10));
    file_index=num2str(ind+1000000);
    imwrite(zrn400./1.5,[ file_index(2:end) '.png'],'png');
    ind=ind+1
end
