function [y t]=generate_event_time_series_from_stim_times(stim_frame,Fs,fps,number_recorded_points)
%y=generate_event_time_series_from_stim_times(stim_frame,Fs,total_frames)
%returns time series of stimulus events (0=no stimulus, 1=stimulus)
% at Fs samples per second
%   Fs  sampling frequency
%   stim_frames vector with frame time series 


%  frame duration (sec)
%f_d=1/fps;

% total time of stimulus in seconds
%t_tot=length(stim_frames)/fps;

% time steps
t=0:1/Fs:(number_recorded_points-1)/Fs;

% initialize 
tim_stimframes=zeros(1,number_recorded_points);

%upsample stimulus frames
 stim_frame_up=upsample(stim_frame,ceil(Fs/fps));
 
 tim_stimframes(1:length(stim_frame_up))=stim_frame_up;
 y=tim_stimframes;
 