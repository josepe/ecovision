function y=obtain_event_time_series(x)
%returns time series of stimulus events (0=no stimulus, 1=stimulus)
% 
% 
% ind_events=find(x>2); 
% 
% dif_high=diff(ind_events); 		%diff vector
% fy=find(dif_high>1)+1;
% ty=ind_events(difffy);
% yo=zeros(size(x));
% yo(ty)=ones(1,length(ty));
% y=yo;


dif=diff(x);
ty=find(dif>0);
yo=zeros(size(x));
yo(ty)=ones(1,length(ty));
y=yo;
