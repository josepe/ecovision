
wrange_time=2; %windows range in msec
wrange_points=wrange_time/1000*fs;
wp_inicial=round(wrange_points/2);
wp_final=round(wrange_points/2);

%generate the spikelist
spikelist=zeros(length(spikestamp),wrange_points);

numneigh=4; %number of neighbors

spikeneighborlist=zeros(length(spikestamp),wrange_points*numneigh);

for k=1:length(spikestamp)
    spikelist(k,:)=s_filtered(spikestamp(k)-wp_inicial:spikestamp(k)+wp_final-1);
    spikeneighborlist(k,:)=[e1f(spikestamp(k)-wp_inicial:spikestamp(k)+wp_final-1);...
                            e2f(spikestamp(k)-wp_inicial:spikestamp(k)+wp_final-1);...
                            e3f(spikestamp(k)-wp_inicial:spikestamp(k)+wp_final-1);...
                            e4f(spikestamp(k)-wp_inicial:spikestamp(k)+wp_final-1) ];

end