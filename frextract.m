function [frindices, frameinterv,rojinterv] =frextract(roj,thres)
% roj input time series
% cut levels

% extract periods above threshold
pers=roj(:,2)>thres;
persr=pers;
if pers(1)==1
    persr=[0 ;persr(2:end-1)];
end


startred=find(diff(persr)==1); %
endred=find(diff(persr)==-1)+1; %

startframe=find(diff(pers)==-1)+1; %start times of frames
endframe=find(diff(pers)==1); %


if startframe(1)>endframe(1)
    endframe(1)=[];
end

if startred(1)>endred(1)
    endred(1)=[];
end


maxindfr=min(length(startframe),length(endframe));
maxindred=min(length(startred),length(endred));

frindices=startframe;
frameinterv=[startframe(1:maxindfr) endframe(1:maxindfr)];
rojinterv=[startred(1:maxindred) endred(1:maxindred)];