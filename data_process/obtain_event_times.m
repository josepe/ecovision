function y=obtain_event_times(x)
%returns onset times of stimulus events (0=no stimulus, 1=stimulus)



dif=diff(x);
ty=find(dif>0);
y=ty;