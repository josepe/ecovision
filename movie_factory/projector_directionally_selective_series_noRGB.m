function y=projector_directionally_selective_series(G,B,sideout,upperleft)
%G,B level of green and blue in ON squares
%upperleft=[100 100];
%prepared for 30fps

%base background image
%yblk=generate_RGB_rectangle_image(sideout-20,sideout,[0 0 0]);

%define R channel sequence
%use only three red levels
depth=[90 173 256]/256 ;
%angle=[0 180 90 270 45 225 135 315];
%angle=[0 180];
%angle=[90 270];
%angle=[45 225];
angle=[135 315];

length=200 %bar length in pixels
width=50   %bar width in pixels

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%background image sequence %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

yr1=generate_RGB_rectangle_image(20,sideout,[depth(1) 0 0]);
yr2=generate_RGB_rectangle_image(20,sideout,[depth(2) 0 0]);
yr3=generate_RGB_rectangle_image(20,sideout,[depth(3) 0 0]);
%yr4=generate_RGB_rectangle_image(20,sideout,depth(4),0,0);

im1=cat(1,yblk,yr1);
im2=cat(1,yblk,yr2);
im3=cat(1,yblk,yr3);
%im4=cat(1,yblk,yr4);    


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% stim image sequence %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%stand alone stimulus image %%



%1000 ms inversion period
% K=number of stimuli presentations
% n?mero total de frames por ciclo =160 on 160 off + 60 background =380

in=0;
%%%%%BACKGROUND%%%%%
    for i=0:3:120
        
        % dark background
        file_index=num2str(in+1000000);in=in+1;
        imwrite(im1,[ file_index(2:end) '.png'],'png');
        file_index=num2str(in+1000000);in=in+1;
        imwrite(im2,[ file_index(2:end) '.png'],'png');
        file_index=num2str(in+1000000);in=in+1;
        imwrite(im3,[ file_index(2:end) '.png'],'png');
%         file_index=num2str(in+1000000);in=in+1;
%         imwrite(im4,[ file_index(2:end) '.png'],'png');
        
    end 
    
    for p=angle  %bar movement direction
        
        ip=1;
        
        for i=0:3:266 %266 number of frames to move 800px at 300um/sec
            
            for l=1:3
                ipN=ip+width;
                bar=zeros(800); %square 800 pixels on one side (to be cropped to 600px later)
                bar((800-length)/2:(800-length)/2+length-1,ipN:ipN+width-1)=ones(length,width); %draw bar
                bar=imrotate(bar,p,'bilinear','crop'); %rotate bar
                ba=cat(3,zeros(size(bar,1),size(bar,2)),G*bar,B*bar);
                eval(['ba' num2str(l) '=ba(101:700,101:700,:);']);
                ip=ip+3;
            end
            
            ran1=embed_matrix_RGB(im1,ba1,upperleft);
            ran2=embed_matrix_RGB(im2,ba2,upperleft);
            ran3=embed_matrix_RGB(im3,ba3,upperleft);
            
            file_index=num2str(in+1000000);in=in+1;
            imwrite(ran1,[ file_index(2:end) '.png'],'png');
            file_index=num2str(in+1000000);in=in+1;
            imwrite(ran2,[ file_index(2:end) '.png'],'png');
            file_index=num2str(in+1000000);in=in+1;
            imwrite(ran3,[ file_index(2:end) '.png'],'png');
            
        end
        for i=0:3:60
            
            % dark background
            file_index=num2str(in+1000000);in=in+1;
            imwrite(im1,[ file_index(2:end) '.png'],'png');
            file_index=num2str(in+1000000);in=in+1;
            imwrite(im2,[ file_index(2:end) '.png'],'png');
            file_index=num2str(in+1000000);in=in+1;
            imwrite(im3,[ file_index(2:end) '.png'],'png');
            %         file_index=num2str(in+1000000);in=in+1;
            %         imwrite(im4,[ file_index(2:end) '.png'],'png');
            
        end
        
    end
y=0;
