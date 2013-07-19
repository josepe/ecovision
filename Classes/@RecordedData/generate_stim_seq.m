function out=get_spikes(in,fs)

stamp_anterior=0;
tiempo_rechazo = 2; %tiempo rechazo interspike para deteccion, 2ms
tpo_rechazo_pts = 2 / 1000 * fs; %en ms

umbral=5*median(abs(in/1000)/0.6745); %formula emp?rica Quian-Quiroga

pos=find(abs(in/1000)>umbral); %spike position in points

kk=1;
spikestamp=[];

for k=1:length(pos);
    valor=abs(in(pos(k)));
    anterior=abs(in(pos(k)-1));
    posterior=abs(in(pos(k)+1));
    
    if (valor>anterior)&&(valor>posterior)&&(pos(k)>(tpo_rechazo_pts+stamp_anterior))
        spikestamp(kk)=pos(k);
        kk=kk+1;
        stamp_anterior=pos(k);
    end
    
    %if (abs(s_ne(pos(k))/1000)>abs(s_ne(pos(k)-1)))&&(abs(s_ne(pos(k))/1000)>abs(s_ne(pos(k)+1)))
    %     if ((s_ne(pos(k))/1000)>(s_ne(pos(k)-1)))&&((s_ne(pos(k))/1000)>(s_ne(pos(k)+1)))
    %         spikestamp(kk)=pos(k);
    %         kk=kk+1;
    %     end
end
out=spikestamp;
end
