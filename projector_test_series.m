function y=projector_test_series(G,B,sidein,sideout,upperleft,K)

%prepared for 60fps

%base background image
yblk=generate_RGB_rectangle_image(sideout-20,sideout,0,0,0);

%define R channel sequence
depth=(32+56*[1 2 3 4])/256;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%background image sequence %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

yr1=generate_RGB_rectangle_image(20,sideout,depth(1),0,0);
yr2=generate_RGB_rectangle_image(20,sideout,depth(2),0,0);
yr3=generate_RGB_rectangle_image(20,sideout,depth(3),0,0);
yr4=generate_RGB_rectangle_image(20,sideout,depth(4),0,0);

im1=cat(1,yblk,yr1);
im2=cat(1,yblk,yr2);
im3=cat(1,yblk,yr3);
im4=cat(1,yblk,yr4);    


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% stim image sequence %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%stand alone stimulus image %

yr=generate_RGB_rectangle_image(sidein,sidein,0,G,B);

%combine background image with stimulus
sim1=embed_matrix_RGB(im1,yr,upperleft);
sim2=embed_matrix_RGB(im2,yr,upperleft);
sim3=embed_matrix_RGB(im3,yr,upperleft);
sim4=embed_matrix_RGB(im4,yr,upperleft);



% K=number of stimuli presentations

for k=0:K
    for i=k*298+0:4:k*298+280
        
        file_index=num2str(i+1000000);
        imwrite(im1,[ file_index(2:end) '.png'],'png');
        file_index=num2str(i+1+1000000);
        imwrite(im2,[ file_index(2:end) '.png'],'png');
        file_index=num2str(i+2+1000000);
        imwrite(im3,[ file_index(2:end) '.png'],'png');
        file_index=num2str(i+3+1000000);
        imwrite(im4,[ file_index(2:end) '.png'],'png');
        
    end
    
    
    for i=k*298+281:4:k*298+298
        
        file_index=num2str(i+1000000);
        imwrite(sim1,[ file_index(2:end) '.png'],'png');
        file_index=num2str(i+1+1000000);
        imwrite(sim2,[ file_index(2:end) '.png'],'png');
        file_index=num2str(i+2+1000000);
        imwrite(sim3,[ file_index(2:end) '.png'],'png');
        file_index=num2str(i+3+1000000);
        imwrite(sim4,[ file_index(2:end) '.png'],'png');
        
    end
end
y=0;
