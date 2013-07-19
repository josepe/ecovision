function y=projector_contrast_inversion_series_bak(G,B,sideout,upperleft,K)
%G,B level of green and blue in ON squares
%upperleft=[100 100];
%prepared for 30fps

%base background image
yblk=generate_RGB_rectangle_image(sideout-20,sideout,[0 0 0]);

%define R channel sequence
depth=(32+56*[1 2 3 4])/256;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%background image sequence %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

yr1=generate_RGB_rectangle_image(20,sideout,[depth(1) 0 0]);
yr2=generate_RGB_rectangle_image(20,sideout,[depth(1) 0 0]);
yr3=generate_RGB_rectangle_image(20,sideout,[depth(1) 0 0]);
yr4=generate_RGB_rectangle_image(20,sideout,[depth(1) 0 0]);

im1=cat(1,yblk,yr1);
im2=cat(1,yblk,yr2);
im3=cat(1,yblk,yr3);
im4=cat(1,yblk,yr4);    


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% stim image sequence %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%stand alone stimulus image %%


check_on=checkerboard(100,6)>0.5;
check_on=check_on(1:600,1:600);

 
%check_on=checkerboard(8,6)>0.5;
%check_on=check_on(1:96,1:96);
check_off=1-check_on;

chk_on=cat(3,zeros(size(check_on,1),size(check_on,2)),G*check_on,B*check_on);
chk_of=cat(3,zeros(size(check_off,1),size(check_off,2)),G*check_off,B*check_off);



%combine background image with stimulus
on1=embed_matrix_RGB(im1,chk_on,upperleft);
on2=embed_matrix_RGB(im2,chk_on,upperleft);
on3=embed_matrix_RGB(im3,chk_on,upperleft);
on4=embed_matrix_RGB(im4,chk_on,upperleft);

of1=embed_matrix_RGB(im1,chk_of,upperleft);
of2=embed_matrix_RGB(im2,chk_of,upperleft);
of3=embed_matrix_RGB(im3,chk_of,upperleft);
of4=embed_matrix_RGB(im4,chk_of,upperleft);

%1000 ms inversion period
% K=number of stimuli presentations
% n?mero total de frames por ciclo =160 on 160 off + 60 background =380

%%%%%BACKGROUND%%%%%
    for i=k*92+0:4:k*92+60
        % dark background
        file_index=num2str(i+1000000);
        imwrite(im1,[ file_index(2:end) '.png'],'png');
        file_index=num2str(i+1+1000000);
        imwrite(im2,[ file_index(2:end) '.png'],'png');
        file_index=num2str(i+2+1000000);
        imwrite(im3,[ file_index(2:end) '.png'],'png');
        file_index=num2str(i+3+1000000);
        imwrite(im4,[ file_index(2:end) '.png'],'png');
        
    end
 for k=0:K   
  i  
    for i=k*32+60:4:k*32+60+16
        
        %4 repeticiones = 16frames, @30fps =600ms
        file_index=num2str(i+1000000);
        imwrite(on1,[ file_index(2:end) '.png'],'png');
        file_index=num2str(i+1+1000000);
        imwrite(on2,[ file_index(2:end) '.png'],'png');
        file_index=num2str(i+2+1000000);
        imwrite(on3,[ file_index(2:end) '.png'],'png');
        file_index=num2str(i+3+1000000);
        imwrite(on4,[ file_index(2:end) '.png'],'png');
    end
 i   
    for i=k*32+60+16:4:k*32+60+2*16
       
        %4 repeticiones = 16frames, @30fps =600ms
        file_index=num2str(i+1000000);
        imwrite(of1,[ file_index(2:end) '.png'],'png');
        file_index=num2str(i+1+1000000);
        imwrite(of2,[ file_index(2:end) '.png'],'png');
        file_index=num2str(i+2+1000000);
        imwrite(of3,[ file_index(2:end) '.png'],'png');
        file_index=num2str(i+3+1000000);
        imwrite(of4,[ file_index(2:end) '.png'],'png');
    end
        
i    
end

y=0;
