function y=extract_events(x,t,tbef,taft)
%extract events at time t, tbef ms before, taft ms after event
%occurence. If x is a matrix, operates over columns
y=zeros(taft+tbef+1,length(t),size(x,2));
for i=1:size(x,2)
    for j=1:length(t)
        y(:,j,i) = x([t(j)-tbef:t(j)+taft],i);
    end
end

