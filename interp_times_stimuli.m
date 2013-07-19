function y=interp_times_stimuli(stim_times,timesteps)

%function y=interp_times_stimuli(stim_times,timesteps)
%returns indices in time_steps series (series of time points) nearest to
%stim_times

y=interp1(timesteps,1:length(timesteps),stim_times,'nearest');
    
    