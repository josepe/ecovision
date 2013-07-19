di=dir('syn*.mat');

for i=1:length(di)
    i
    load(di(i).name);
    var=di(i).name;
    frameparams;
%   eval(['roj=' var(1:end-4) ';'])
   % eval(['frames=red2frame(' var(1:end-4) ',params);']);
    [frames.startend, frames.startstim frames.endstim]=getredscreen(frames.frindices, frames.indlevel,params.minframes,params.level);
    save(di(i).name,'frames','params',var(1:end-4));
end