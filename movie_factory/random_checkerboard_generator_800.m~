%random_checkerboard_generator(n_frames,filename)
%generates a black and white checkerboard contrast inversion movie 


G=1; 
B=1;

for i=0:53999
    zrn= randi([0,1],[40,40]);
    zrn100=kron(zrn,ones(20));
    chk=cat(3,zeros(size(zrn100,1),size(zrn100,2)),G*zrn100,B*zrn100);
    file_index=num2str(i+100000);
    imwrite(chk,[ file_index(2:end) '.png'],'png');
end
