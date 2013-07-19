function projector_movie_series(stim,ind_color,GB)

%GB=0 G
%GB=1 B

dir_out=stim.dir_out(ind_color,GB+1);

%base background image
col=[0 (1-GB)*stim.colores_basal(ind_color) GB*stim.colores_basal(ind_color)];

yblk=generate_RGB_rectangle_image(stim.side-stim.red_h,stim.side,col);

%define R channel sequence
depth=stim.reds;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%background image sequence %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

yr1=generate_RGB_rectangle_image(stim.red_h,stim.side,[depth(1) 0 0]);
yr2=generate_RGB_rectangle_image(stim.red_h,stim.side,[depth(2) 0 0]);

im1=cat(1,yblk,yr1);
im2=cat(1,yblk,yr2);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%start and end marker image%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ymark1=generate_RGB_rectangle_image(stim.side,stim.side,[64/256 0 0]);
ymark2=generate_RGB_rectangle_image(stim.side,stim.side,[64/256 0 0]);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% stim image sequence %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%stand alone stimulus image %%

colors=stim.colors(ind_color,:);

in=0;

for k=1:length(colors)
    
    col=[0 (1-GB)*colors(k) GB*colors(k)];
    
    %%%%% BACKGROUND  60fps %%%%%
    
    for i=1:900
        %  background
        file_index=num2str(in+1000000);in=in+1;
        imwrite(im1,[char(dir_out) '/' file_index(2:end) '.png'],'png');
        file_index=num2str(in+1000000);in=in+1;
        imwrite(im2,[char(dir_out) '/' file_index(2:end) '.png'],'png');
    end
    
    file_index=num2str(in+1000000);in=in+1;
    imwrite(ymark1,[char(dir_out) '/' file_index(2:end) '.png'],'png');
    file_index=num2str(in+1000000);in=in+1;
    imwrite(ymark2,[char(dir_out) '/' file_index(2:end) '.png'],'png');
    
    for i=1:60
        
        z=generate_RGB_rectangle_image(stim.side-stim.red_h,stim.side,col);
        
        ran1=cat(1,z,yr1);
        file_index=num2str(in+1000000);in=in+1;
        imwrite(ran1,[char(dir_out) '/' file_index(2:end) '.png'],'png');
        file_index=num2str(in+1000000);in=in+1;
        imwrite(im2,[ char(dir_out) '/' file_index(2:end) '.png'],'png');
        
        
    end
    
    file_index=num2str(in+1000000);in=in+1;
    imwrite(ymark1,[char(dir_out) '/' file_index(2:end) '.png'],'png');
    file_index=num2str(in+1000000);in=in+1;
    imwrite(ymark2,[char(dir_out) '/' file_index(2:end) '.png'],'png');
    
end