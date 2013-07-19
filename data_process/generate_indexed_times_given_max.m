function y=generate_indexed_times_given_max(max_value,Fs)
% y=generate_indexed_times(vector_length,Fs)
% given generates a series of times at Fs samples per second, indexed by
% 1:vector length indices

py=0:1/Fs:max_value;
y=py';
    