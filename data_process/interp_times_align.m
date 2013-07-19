function y=interp_times_align(timesteps1,timesteps2,fs1,fs2)

%function y=interp_times_align(timeseries1,timeseries2,fs1,fs2)
%returns inidices in 
%stim_times

y=interp1(timesteps,1:length(timesteps),stim_times,'nearest');
    
    