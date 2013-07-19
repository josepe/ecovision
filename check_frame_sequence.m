function out=check_frame_sequence(frames,sequence,modul)
%check for disparities between observed and theoretical frame sequences
%(0=OK)

len=min(length(frames.indlevel),length(sequence));
out=any((mod(sequence(1:len)-1,modul)+1)-frames.indlevel(1:len));
end