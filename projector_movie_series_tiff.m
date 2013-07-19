    function y=projector_movie_series_tiff(sideout,upperleft,dir_in,dir_out)
%this version doubles the number of frames by duplicating each image
%G,B level of green and blue in ON squares
%upperleft=[100 100];
%prepared for 30fps

%base background image
yblk=generate_RGB_rectangle_image(sideout-20,sideout,0,0,0);

%define R channel sequence
depth=[90 173 256]/256 ;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%background image sequence %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

yr1=generate_RGB_rectangle_image(20,sideout,depth(1),0,0);
yr2=generate_RGB_rectangle_image(20,sideout,depth(2),0,0);
yr3=generate_RGB_rectangle_image(20,sideout,depth(3),0,0);
%yr4=generate_RGB_rectangle_image(20,sideout,depth(4),0,0);

im1=cat(1,yblk,yr1);
im2=cat(1,yblk,yr2);
im3=cat(1,yblk,yr3);
%im4=cat(1,yblk,yr4);    


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% stim image sequence %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%stand alone stimulus image %%

maxg=0;
maxb=0;
di_p=dir([dir_in '/*.tiff']);

for j=1:length(di_p)
    %reorder file names
    cdi=di_p(j).name;
    numd=str2num(cdi(3:end-5));
    di(numd).name=di_p(j).name;
  
    %find maximum intensity across frames
    zmax= imread([dir_in '/' di_p(j).name]);
    maxg=double(max(maxg,max(max(zmax(:,:,2)))));
    maxb=double(max(maxb,max(max(zmax(:,:,3)))));
  
    
    
end
   
    

in=0;
ik=1;   

%%%%%BACKGROUND%%%%%
    for i=0:3:120
        % dark background
        file_index=num2str(in+1000000);in=in+1;
        imwrite(im1,[dir_out '/' file_index(2:end) '.png'],'png');
        file_index=num2str(in+1000000);in=in+1;
        imwrite(im2,[dir_out '/' file_index(2:end) '.png'],'png');
        file_index=num2str(in+1000000);in=in+1;
        imwrite(im3,[dir_out '/' file_index(2:end) '.png'],'png');
%         file_index=num2str(in+1000000);in=in+1;
%         imwrite(im4,[dir_out '/' file_index(2:end) '.png'],'png');
        
    end  
    
    for i=0:3:length(di)-3
        zrn= imread([dir_in '/' di(ik).name]);zrn1=cat(3,zeros(size(zrn,1),size(zrn,2)),double(zrn(:,:,2))/maxg,double(zrn(:,:,3))/maxb);ik=ik+1;
        zrn1 = imresize(zrn1, 1.5);
        
        zrn= imread([dir_in '/' di(ik).name]);zrn2=cat(3,zeros(size(zrn,1),size(zrn,2)),double(zrn(:,:,2))/maxg,double(zrn(:,:,3))/maxb);ik=ik+1;
        zrn2 = imresize(zrn2, 1.5);
        
        zrn= imread([dir_in '/' di(ik).name]);zrn3=cat(3,zeros(size(zrn,1),size(zrn,2)),double(zrn(:,:,2))/maxg,double(zrn(:,:,3))/maxb);ik=ik+1;
        zrn3 = imresize(zrn3, 1.5);
        
        % zrn= imread([dir_in '/' di(ik).name]);zrn4=cat(3,zeros(size(zrn,1),size(zrn,2)),zrn(:,:,2)/maxg,zrn(:,:,3)/maxb);ik=ik+1;
        
        
        
        ran1=embed_matrix_RGB(im1,zrn1,upperleft);
        ran2=embed_matrix_RGB(im2,zrn2,upperleft);
        ran3=embed_matrix_RGB(im3,zrn3,upperleft);
        %ran4=embed_matrix_RGB(im4,zrn4,upperleft);
        
        
        file_index=num2str(in+1000000);in=in+1;
        imwrite(ran1,[dir_out '/' file_index(2:end) '.png'],'png');
        file_index=num2str(in+1000000);in=in+1;
        imwrite(ran2,[ dir_out '/' file_index(2:end) '.png'],'png');
        file_index=num2str(in+1000000);in=in+1;
        imwrite(ran3,[dir_out '/' file_index(2:end) '.png'],'png');
%         file_index=num2str(in+1000000);in=in+1;
%         imwrite(ran4,[dir_out '/' file_index(2:end) '.png'],'png');
%         
        
    end
    

y=0;
