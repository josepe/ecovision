%% feature extraction (only seed)
[pc,scores,latent,tsquare] = princomp(spikelist/1000);
%[coefs,scores,variances,t2]

hf=figure;
h1=axes;
plot(scores(:,1),scores(:,2),'+');
title('Features PCA (seed)');
xlabel('PC1');
ylabel('PC2');
grid
print( hf, '-djpeg', ['pca.jpg']); %