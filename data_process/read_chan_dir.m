function des=read_chan_dir()
% loads all data files in a directory and concatenates data series

di=dir('*chan.mat');
des=[];
for i=0:length(di)-1
    i
    load(di(i+1).name);
    eval(['tmp=[exp16e' num2str(i) '_chan];']);
    des=[des;tmp];
    
end