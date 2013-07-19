function y=directionally_selective_2(prev,interstim)

angles=[0  90  180  270];
%angles=[0 90];

%num_bars=140;
num_bars=160;

y=generate_dark_image_2(0,prev);
%y=0;
for i=1:length(angles)
    y=generate_dark_image_2(y,interstim);
    y=generate_moving_bars_2(y,num_bars,angles(i));
end      



