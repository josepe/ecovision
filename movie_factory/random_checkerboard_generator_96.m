%random_checkerboard_generator(n_frames,filename)
%generates a black and white checkerboard contrast inversion movie 




for i=0:53999
    zrn= randi([0,1],[40,40]);
    zrn100=kron(zrn,ones(20));
    file_index=num2str(i+100000);
    imwrite(zrn100,[ file_index(2:end) '.png'],'png');
end
