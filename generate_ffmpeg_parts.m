%function y=generate_ffmpeg_parts()
%generates a black and white checkerboard contrast inversion movie 


% for i=1:69
%     dir_index=num2str(i+100);
%     dir_index=dir_index(2:end);
%     system(['mkdir ' dir_index]);
%     system(['cd ' dir_index]);
    
    for j=0:659
        zrn= randi([0,1],[10,10]);
        zrn100=kron(zrn,ones(10));
        file_index=num2str(j+100000)
        imwrite(zrn100,[ file_index(2:end) '.jpg'],'jpg');
    end
    %generate intermediate movie
    system(['/opt/local/bin/ffmpeg -f image2 -r 15  -i %05d.png -s 90x90 -mbd rd -flags +mv4+aic -trellis 2 -cmp 2 -subcmp 2 -g 300  -bf 2 -flags qprd -flags mv0 test.mpg']);
    %move intermediate movie to parent directory
%     system(['mv ' dir_index '.mpg ..']);
%     %change directory
%     system('cd ..')
%     
% end
