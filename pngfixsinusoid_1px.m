filename='001848.png';
frr=imread(filename);
fps=30;
amp=12; % microns
umperpix=4;  %microns per pixel  
amppix=amp/umperpix;
period=.05;  %period s
%interruption_cycle=10s=


num_images=20*30;


% t=1/fps:1/fps:num_images/fps;
% disp=round(amppix*sin(2*pi*t/period));
di0=[0 1 0 -1];
disp=repmat(di0,1,150)

ind=1;
for k=1:num_images  %3min @ 30fps 
    
    %fr=fr(161:560,441:840,:); %400 px
    fr=frr(111:610,391+disp(k):890+disp(k),:); %500 px
    fr=frr(161:560,441+disp(k):840+disp(k),:); %400 px
    
    
    file_index=num2str(ind+1000000);
    imwrite(fr,[ file_index(2:end) '.png'],'png');
    ind=ind+1
end
