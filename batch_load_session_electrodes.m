%batch load session-wide spike trains into a single file

%session name
batch_load_electrode_params;
for j=9:length(electrode_params)
    
    
    session_name=electrode_params(j).session_name
    matfile_name=electrode_params(j).matfile_name;
    file_name=electrode_params(j).file_name;
    save(matfile_name,'session_name','file_name');
    
    % list directories
    di=dir('.');
    k=1;
    for i=1:length(di)
        if regexp(di(i).name,'^[A-Z]')
            diout(k).filename=fullfile(pwd,di(i).name,file_name);
            diout(k).varname=[lower(di(i).name) '_' session_name];
            k=k+1;
        end
    end
    
    clear i k
    for k=1:length(diout)
        importfile_spikes(diout(k).filename,diout(k).varname)
        save(matfile_name,'-append',diout(k).varname);
    end

end