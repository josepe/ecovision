function frames=red2frame(roj,params)

%master function to extract all frame series

[frames.frindices frames.frameinterv frames.rojinterv]=frextract(roj,params.thres);
[frames.levels  frames.indlevel]= getlevels(roj,frames.rojinterv,params.cuts);
[frames.startend, frames.startstim frames.endstim]=getredscreen(frames.frindices, frames.indlevel,params.minframes,params.level);
frames.times=roj(:,1);
end

%,params.maxstim