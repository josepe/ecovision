function event_times2=align_indexed_times(index_times1,index_times2,event_times1)
% function
% event_times2=align_indexed_times(index_times1,index_times2,event_times1)
% given a series of times (index_times1) and events (event_times1) with a common index,
% create a new series (event_times2) of the same event with indexed as
% event_times1

event_times2=interp1(index_times1,event_times1,index_times2);