%function y = decimateLFP_1k()
%decimate all imp signals in workspace to 1kHz
ws=whos('int*')
for i=1:length(ws)
    eval(['intf5=resample(' ws(i).name ',1,5);']);
    intf1=resample(intf5,1,4);
    eval(['d' ws(i).name '=intf1;']);
end
clear intf1 intf5;