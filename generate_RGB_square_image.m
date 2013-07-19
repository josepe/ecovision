function y=generate_RGB_square_image(side,R,G,B);

yr=R*ones(side);
yg=G*ones(side);
yb=B*ones(side);

y=cat(3,yr,yg,yb);