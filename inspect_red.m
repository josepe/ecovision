function inspect_red(roj,frames)
figure,plot(roj(:,1),roj(:,2));
hold;
plot(roj(frames.frindices,1),ones(1,length(frames.frindices)),'k.');
plot(roj(frames.startstim,1),ones(1,length(frames.startstim)),'g.');
plot(roj(frames.endstim,1),ones(1,length(frames.endstim)),'r.');
plot(roj(frames.frindices,1),200000*frames.indlevel,'m.');
end

