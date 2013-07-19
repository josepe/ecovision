function y=R_frame_test1()
%generates a black and white checkerboard contrast inversion movie 
%version uses 96x96 stim
%12 squares per side, 8 pixels per square
% file are named in sequence .png
% beggining filename
% num_squares= number of squares
% pixels_per_square=number of pixels per square
% polarity =0 if upper left pixel is white =1 if black


im=zeros(200);
im(1,:)=ones(1,200);
for i=1:6000
        file_index=num2str(i-1+1000000);
        imwrite(im,[ file_index(2:end) '.png'],'png');
end
y=file_index(2:end);

