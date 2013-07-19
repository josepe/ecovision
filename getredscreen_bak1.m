function [stimsegments, startstim , endstim]=getredscreen(frindices,indlevel,minframes,level,maxstim)
% roj input time series
% cut levels

% find frames where full field red screen is present. 


% roj input time series
% cut levels




 
 
 
%extract periods above threshold
pers=indlevel==level;
% %find starting index of each period
% startred=find(diff(pers)==1); %
% %find end indices of each period
% startfr=find(diff(pers)==-1)+1; %start times of frames
%a frame occurs between consecutive ends
 
% pair starts with ends for red bar duration[levels,indlevel]
% =getlevels(roj,rojinterv,cuts)
% data before first falling edge is not considered
 
%frame vectors (times marking beginning of each frame)
 
 
if pers(1)==1
   pers(1)=0;
end
 
startred=find(diff(pers)==1); %
startfr=find(diff(pers)==-1)+1; %start times of frames
 
 
 
% if startfr(end)<startred(end)
%     startred(end)=[];
% end
% red vectors (segments containing red signal)
maxind=min(length(startred),length(startfr));
rojinterv=[startred(1:maxind) startfr(1:maxind)];
interdur=diff(rojinterv,1,2); %interval lengths
longframes=interdur>=minframes;
startstim=frindices(startfr(longframes));
startstim=startstim(1:maxstim);
endstim=frindices(startred(longframes)+2);
endstim=endstim(2:maxstim+1);
stimsegments=[startstim endstim];
