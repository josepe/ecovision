function y=test_movie_RBlack()

yblk=generate_RGB_rectangle_image(180,200,.25,.25,0);

depth=(32+56*[1 2 3 4])/256;


yr1=generate_RGB_rectangle_image(20,200,depth(1),0,0);
yr2=generate_RGB_rectangle_image(20,200,depth(2),0,0);
yr3=generate_RGB_rectangle_image(20,200,depth(3),0,0);
yr4=generate_RGB_rectangle_image(20,200,depth(4),0,0);
im1=cat(1,yblk,yr1);
im2=cat(1,yblk,yr2);
im3=cat(1,yblk,yr3);
im4=cat(1,yblk,yr4);




for i=1:4:6000
    
        file_index=num2str(i+1+1000000);
        imwrite(im1,[ file_index(2:end) '.png'],'png');
        file_index=num2str(i+2+1000000);
        imwrite(im2,[ file_index(2:end) '.png'],'png');
        file_index=num2str(i+3+1000000);
        imwrite(im3,[ file_index(2:end) '.png'],'png');
        file_index=num2str(i+4+1000000);
        imwrite(im4,[ file_index(2:end) '.png'],'png');
      
end