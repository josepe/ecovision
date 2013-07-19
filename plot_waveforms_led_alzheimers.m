%script to compute and plot mean response waveforms


eve35=extract_events(dint35,timstim,500,5000);
eve42=extract_events(dint42,timstim,500,5000);
eve52=extract_events(dint52,timstim,500,5000);
eve6=extract_events(dint6,timstim,500,5000);
eve76=extract_events(dint76,timstim,500,5000);
eve9=extract_events(dint9,timstim,500,5000);

meve35=mean(eve35(:,:,2)');
meve42=mean(eve42(:,:,2)');
meve52=mean(eve52(:,:,2)');
meve6=mean(eve6(:,:,2)');
meve76=mean(eve76(:,:,2)');
meve9=mean(eve9(:,:,2)');

figure
plot(meve35,'black');hold;
plot(meve42,'b');
plot(meve52,'g');
plot(meve6,'c');
plot(meve76,'m');
plot(meve9,'r');

