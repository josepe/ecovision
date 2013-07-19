function fr=checkerboard_generator_2_movie()
% function fr=checkerboard_generator_2_movie(filename)
% generates a black and white checkerboard contrast inversion movie 
% file are named in sequence .png
% beggining filename
% num_squares= number of squares
% pixels_per_square=number of pixels per square
% polarity =0 if upper left pixel is white =1 if black

%aviobj=avifile(filename,'compression','None');
check_on=checkerboard(30,3)>0.5;
check_on=check_on(1:90,1:90);
frch_on=im2frame(uint8(check_on)*255,gray);

check_off=(check_on<0.5);
frch_off=im2frame(uint8(check_off)*255,gray);
k=1;
for i=1:20
    for j=0:24
        %aviobj=addframe(aviobj,frch_on);
        fr(k)=frch_on;
        k=k+1;
    end
        
    for j=25:49
        %aviobj=addframe(aviobj,frch_off);
        fr(k)=frch_off;
        k=k+1;
    end
end

%aviobj=close(aviobj);