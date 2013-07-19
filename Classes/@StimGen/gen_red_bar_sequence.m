function out=gen_red_bar_sequence(in)
seq=1:10;
st=1:3;
x=length(st);
z=kron(ones(1,ceil(length(seq)/x)),st);
out=z(1:length(seq));
end
