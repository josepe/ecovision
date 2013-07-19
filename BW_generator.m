%BW_generator(n_frames,filename)
%generates a series of black and white full field alternation images 
% num_squares= number of squares
% pixels_per_square=number of pixels per square
% polarity =0 if upper left pixel is white =1 if black



off=zeros(96);
on=ones(96);
for i=1:20
    for j=0:19
        file_index=num2str(25*(i-1)+j+1000000);
        imwrite(off,[ file_index(2:end) '.png'],'png');
    end
        for j=20:24
        file_index=num2str(25*(i-1)+j+1000000);
        imwrite(on./2,[ file_index(2:end) '.png'],'png');
        end
        
     
 end
        
   
    


