function y=checkerboard_timeseries_generator()
%generates timeseries of a black and white checkerboard contrast inversion movie 
% pixels_per_square=number of pixels per square
% 20 repetitions of
% 24 on frames
% 24 off frames
% polarity =1 if upper left pixel is white =-1 if black


for i=1:20
    for j=0:24
        index=50*(i-1)+j+1;
        y(index)=1;
        
    end
 
    for j=25:49
        index=50*(i-1)+j+1;
        y(index)=-1;    
         
    end
end


