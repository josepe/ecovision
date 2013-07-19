function [startend , startstim , endstim]=getredscreen(frindices,indlevel,minframes,level)
% roj input time series
% cut levels

% find frames where full field red screen is present. 


% roj input time series
% cut levels





%extract periods above threshold
pers=indlevel==level;
if pers(1)==1
    pers=[0 ;pers(2:end-1)];
end
%find starting index of each period
startred=find(diff(pers)==1); %
%find end indices of each period
startfr=find(diff(pers)==-1)+1; %start times of frames
%a frame occurs between consecutive ends

if startred(1)>startfr(1)
    startred(1)=[];
end
% pair starts with ends for red bar duration[levels,indlevel]
% =getlevels(roj,rojinterv,cuts)
% data before first falling edge is not considered

%frame vectors (times marking beginning of each frame)

% red vectors (segments containing red signal)


minterv=min(length(startred),length(startfr));
rojinterv=[startred(1:minterv) startfr(1:minterv)];
interdur=diff(rojinterv,1,2); %interval lengths
longframes=interdur>=minframes;
startstim1=frindices(startfr(longframes));
endstim1=frindices(startred(longframes)+1);
startstim=startstim1(1:end-1);
endstim=endstim1(2:end);
startend=[startstim endstim];
