function out=obtain_data_files(in)
% obtains all data files in a directory and concatenates



di=dir(in);
j=0;
for i=1:length(di)
    if ~isempty(regexp(di(i).name, '[0-9].dat$', 'once'))
        j=j+1;
        dat1(j).name=di(i).name;
        dat1(j).name
        
    end
end
out=dat1;
end

