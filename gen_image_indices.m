function out=gen_image_indices(Nrepeat,Nimag,Nframes)

imgindex=1:Nimag;
in=repmat(imgindex,Nrepeat);
imseries=in(1:Nframes);
end