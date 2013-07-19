function sptrial=part_trials(roj,frames,spk,params)


[pks locs]=findpeaks(-spk(:,2),'minpeakheight',params.spthres);
sptimes=spk(locs,1);
for i=1:params.numtrial
     sptrial(i)=extractdatapt(sptimes,[frames.times(frames.startstim(i)) frames.times(frames.startstim(i+1))],1); 
  %   rojtrial(:,i)=extractdatapt(roj(:,2),1,[frames.times(frames.startstim(i)) frames.times(frames.startstim(i+1))]);
end