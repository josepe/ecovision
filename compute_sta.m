function out=compute_sta(mov_seq,frame_seq,spike_fr)

%out=stack of STA delayed images from spiketrain

frame_mat=frame_seq(spike_fr);
%allmat=move_seq(:,:,frame_mat);
for i=1:size(spike_fr,2)
    allmat=mov_seq(:,:,frame_mat(:,i));
    out(:,:,i)=mean(allmat,3);
end
end