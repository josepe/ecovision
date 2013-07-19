
files=dir('*.png');
ind=1
for k=401:2200
    fr=imread(files(k).name);
    %fr=fr(161:560,441:840,:); %400 px
    %fr=fr(61:660,341:940,:); %600 px 
    fr=fr(111:610,391:890,:);  %500 px
    
    file_index=num2str(ind+1000000);
    imwrite(fr,['../natural_500px_60s_30fps/' file_index(2:end) '.png'],'png');
    ind=ind+1
end