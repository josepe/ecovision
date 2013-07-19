%function y=checkerboard_generator(n_frames,filename)
%generates a black and white checkerboard contrast inversion movie 
% num_squares= number of squares
% pixels_per_square=number of pixels per square
% polarity =0 if upper left pixel is white =1 if black



check_on=checkerboard(9,5)>0.5;
check_off=(check_on<0.5);
for i=1:2:40
    for j=0:49
        file_index=num2str(50*(i-1)+j+1000000);
        imwrite(check_on,[ file_index(2:end) '.png'],'png');
        
    end
end
for i=2:2:40
    for j=0:49
        file_index=num2str(50*(i-1)+j+1000000);
        imwrite(check_off,[ file_index(2:end) '.png'],'png');
     
    end
end
