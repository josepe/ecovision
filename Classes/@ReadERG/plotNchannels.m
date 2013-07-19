function plotNchannels(rootfile,chans,writtenframes,fps,Fs,retraso_samples)


%variable time_frame in milliseconds before and after stimulation period
for i=1:length(chans)
    
    finame=['e' num2str(chans(i)) rootfile '.mat'];
    load(finame);
    number_recorded_points=length(signal_ne);
    [y t]=generate_event_time_series_from_stim_times(writtenframes,Fs,fps,number_recorded_points);
    figure,plot(t,signal_ne/max(signal_ne)*2);hold;
    plot(t,y,'r');




end