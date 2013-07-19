function y=R_frame_test3()
%generates a black and white checkerboard contrast inversion movie 
%version uses 96x96 stim
%12 squares per side, 8 pixels per square
% file are named in sequence .png
% beggining filename
% num_squares= number of squares
% pixels_per_square=number of pixels per square
% polarity =0 if upper left pixel is white =1 if black


im_off=zeros(200);
im_on=im_off;
im_on(91:110,91:110)=ones(20,20);
for i=1:2:6000
        file_index_on=num2str(i+1000000);
        file_index_off=num2str(i-1+1000000);
        imwrite(im_off,[ file_index_off(2:end) '.png'],'png');
        imwrite(im_on,[ file_index_on(2:end) '.png'],'png');
end
y=file_index_off(2:end);

