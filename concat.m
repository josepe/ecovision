fr{1}=420:1213;
fr{2}=2330:2653;
fr{3}=3600:5400;
fr{4}=7200:8600;
fr{5}=8400:8760;

ind=1;
for i=1:5
    for k=1:length(fr{i})
        fnum1= 1000000+fr{i}(k);
        fname1=num2str(fnum1);
        fname1=[fname1(2:end) '.png'];
        
        fnum2=num2str(ind+1000000);
        fname2=num2str(fnum2);
        fname2=['../concat/' fname2(2:end) '.png'];
        
        copyfile(fname1,fname2);
        ind=ind+1
    end
end