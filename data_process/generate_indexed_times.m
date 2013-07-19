function y=generate_indexed_times(vector_length,Fs)
% y=generate_indexed_times(vector_length,Fs)
% given generates a series of times at Fs samples per second, indexed by
% 1:vector length indices

oy=ones(1,vector_length)./Fs;
qy=[0 oy];
py=cumsum(qy);
oy=py(1:end-1);
y=oy';
    