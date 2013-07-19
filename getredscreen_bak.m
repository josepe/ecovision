function [startstim , endstim]=getredscreen(frindices,indlevel,minframes,level)
% roj input time series
% cut levels

% find frames where full field red screen is present. 


% roj input time series
% cut levels





%extract periods above threshold
pers=indlevel==level;
%find starting index of each period
startred=find(diff(pers)==1); %
%find end indices of each period
startfr=find(diff(pers)==-1)+1; %start times of frames
%a frame occurs between consecutive ends

% pair starts with ends for red bar duration[levels,indlevel]
% =getlevels(roj,rojinterv,cuts)
% data before first falling edge is not considered

%frame vectors (times marking beginning of each frame)


if pers(1)==1
    startred=[1;startred];
end
if startfr(end)<startred(end)
    startred(end)=[];
end


% red vectors (segments containing red signal)

rojinterv=[startred(1:end-1) startfr];
interdur=diff(rojinterv,1,2); %interval lengths
longframes=interdur>=minframes;
startstim=frindices(startfr(longframes));
endstim=frindices(startred(longframes)+2);
