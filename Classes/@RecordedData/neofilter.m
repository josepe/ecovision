%% NEO FILTER :
x=signal_ne;
phi_x = zeros(size(x,1),size(x,2));
for k = 2:length(x)-1
    phi_x(k) = x(k)^2-x(k-1)*x(k+1);
end