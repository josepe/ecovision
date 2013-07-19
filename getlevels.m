function [levels,indlevel] =getlevels(roj,rojinterv,cuts)
% roj input time series
% cut levels

% get average level for each interval
levels=zeros(size(rojinterv,1),1);
indlevel=levels;
for i=1:length(levels)
levels(i)=max(roj(rojinterv(i,1):rojinterv(i,2),2));
indlevel(i)=find(cuts>levels(i), 1 )-1;
end