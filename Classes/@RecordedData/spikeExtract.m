function out=spikeExtract(in,fs) %return spike times (data points per channel) in cell array
cel=cell(size(in,2),1);
for k=1:size(in,2)
    cel{k}=RecordedData.get_spikes(in(:,k),fs);
end
out=cel;
end