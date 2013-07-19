function RedSeq=gen_red_bar_sequence(set,seq)
st=set.reds;
            x=length(st);
            z=kron(ones(1,ceil(length(seq)/x)),st);
            RedSeq=z(1:length(seq));
            
end