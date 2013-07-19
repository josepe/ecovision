% batch
startstim=startstim05;
data=p605s;
for i=1:length(startstim)-1
    pseg06(i)=extractdatapt(data,[roj03(startstim(i),1) roj03(startstim(i+1),1)]);
end