function st=generate_bar_parallel(st)
% units
% create square image side=box_side, length=barl
 
    
    %%% generate bar(central)
    bar=zeros(st.slack*st.box_side); %bounding box, twice the final size
    stbox=st.slack*st.box_side;
    
    halflength=st.dimensions(1)/2;
    halfwidth=st.dimensions(2)/2;
    bar((stbox/2-halflength:stbox/2+halflength-1),stbox/2-halfwidth:stbox/2+halfwidth-1)=ones(st.dimensions(1),st.dimensions(2));
    
    bar=imrotate(bar,st.angle,'bilinear','crop'); %rotate bar
    
    [row,col,v] = find(bar);
    row=row+stbox/2;
    col=col+stbox/2;
    anrd=2*pi*st.angle/360;
    posx=round(st.pos_along_path*sin(anrd));
    posy=round(st.pos_along_path*cos(anrd));
    
    parx=round(st.parallel_distance*cos(anrd));
    pary=-round(st.parallel_distance*sin(anrd));
    
    bar2=sparse(row-posx-parx,col-posy-pary,v,size(bar,1),size(bar,2));
    yim=full(bar2);
    st.image=yim(int16(0.5*st.box_side*(st.slack-1):0.5*st.box_side*(st.slack+1)-1),int16(0.5*st.box_side*(st.slack-1):0.5*st.box_side*(st.slack+1)-1));
    
    
%     G=color(2);
%     B=color(3);
%     ba=cat(3,zeros(size(bar,1),size(bar,2)),G*bar,B*bar);
%     
%     %shift position
%     % along movement path
%     
%     
%     %   compute translation vector depending on angle
%     bar=bar+coordinates;                        %   translate bars to new coordinates
%     bar=rotate_bar;                             %   rotate ba
%     bar=imrotate(bar,angle,'bilinear','crop');  %   rotate bar
%     cut_box;                %   clip surrounding box
%     
%     
%     
%    
%     
%     
%     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                 bar=imrotate(bar,p,'bilinear','crop'); %rotate bar
%                 ba=cat(3,zeros(size(bar,1),size(bar,2)),G*bar,B*bar);
%                 eval(['ba' num2str(l) '=ba(101:700,101:700,:);']);
%                 ip=ip+3;
%             
           
    
    
    
    
    
    
    
    
    
    
end
