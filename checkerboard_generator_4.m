function y=checkerboard_generator_4(comienzo)
%generates a black and white checkerboard contrast inversion movie 
%version uses 96x96 stim
%12 squares per side, 8 pixels per square
% file are named in sequence .png
% beggining filename
% num_squares= number of squares
% pixels_per_square=number of pixels per square
% polarity =0 if upper left pixel is white =1 if black




check_on=checkerboard(8,6)>0.5;
%check_on=check_on(1:96,1:96);
check_off=(check_on<0.5);
for i=1:20
    for j=0:24
        file_index=num2str(50*(i-1)+j+comienzo+1000000);
        imwrite(check_on./1.5,[ file_index(2:end) '.png'],'png');
    end
 
    for j=25:49
        file_index=num2str(50*(i-1)+j+comienzo+1000000);
        imwrite(check_off./1.5,[ file_index(2:end) '.png'],'png');
     
    end
end


