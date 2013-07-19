function y=random_checkerboard_generator_90(comienzo, final)
%begin=first frame number
%end= last frame number
%random_checkerboard_generator(n_frames,filename)




for i=comienzo:final
    zrn= randi([0,1],[15,15]);
    zrn100=kron(zrn,ones(6));
    file_index=num2str(i+1000000);
    imwrite(zrn100./1.5,[ file_index(2:end) '.png'],'png');
end
