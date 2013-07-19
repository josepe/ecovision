function y=generate_RGB_square_frame(sidein,sideout,Ri,Gi,Bi,Ro,Go,Bo)

yor=Ro*ones(sideout);
yog=Go*ones(sideout);
yob=Bo*ones(sideout);






y=cat(3,yr,yg,yb);