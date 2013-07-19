function out=extract_spikes(in,thresh)


spint2=[];

for i=1:length(thresh)
    
    [spin1 spint1]=findpeaks(sign(thresh(i))*in(:,2),'minpeakheight',sign(thresh(i))*thresh(i));
    spint=setdiff(spint1,spint2);
    spint2=spint1;    
    out(i).t=in(spint,1);
    out(i).v=in(spint,2);
    out(i).ind=spint;
end

end