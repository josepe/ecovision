function out=p2p_spikes(in,thresh,Fs)

%Fs=sampling rate
spt=extract_spikes(in,thres); %assumes negative peaks

%for each spike,fin nearest positive peak (maximmum plus_limit ms after
%negative peak)

for i=1:length(spt)-1
    nextsp=spt(i+1).ind;        ;
    nextnan=find(isnan(k8_1(:,2)),1)        ;
    maxms=          ;
    minwin=min([xms nxtsp nextnan]);
    out(i).t=in.t;
    out(i).dv=    ;
    out(i).ind=in(i).ind ;

