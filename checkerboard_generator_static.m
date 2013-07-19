function y=checkerboard_generator_static(comienzo,sz)
%generates a black and white checkerboard contrast inversion movie 
% num_squares= number of squares
% pixels_per_square=number of pixels per square
% polarity =0 if upper left pixel is white =1 if black




check_on=checkerboard(sz/3,3)>0.5;
%check_on=check_on(1:90,1:90); %modify this for different size square
check_on=check_on(1:sz,1:sz); 

for j=0:2999
        file_index=num2str(j+comienzo+1000000);
        imwrite(check_on./1.5,[ file_index(2:end) '.png'],'png');
end


