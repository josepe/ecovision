function y=readstimul_dir()
% loads all STIM files in a directory and concatenates stimulus series
% y returns stimulus vector (0=stimulus off, 1= stimulus on) 

%code does not allocate memory
stim=[]
dirstim=dir('*STIM*');
for i=1:length(dirstim)
    op=dirstim(i).name
    st=importdata(op);
    stim=[stim; st(:,2)];
end
y=stim;
    
