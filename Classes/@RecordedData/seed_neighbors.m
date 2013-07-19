%% feature extraction (seed+neighbors)
[pc2,scores2,latent2,tsquare2] = princomp(spk_all/1000);
%[coefs,scores,variances,t2]

hf=figure;
h1=axes;
plot(scores2(:,1),scores2(:,2),'+');
title('Features PCA (seed neigh)');
xlabel('PC1');
ylabel('PC2');
grid
print( hf, '-djpeg', ['pca_seed_neigh.jpg']); %