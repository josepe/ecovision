function y=generate_RGB_rectangle_image(length,width,Col)
R=Col(1);
G=Col(2);
B=Col(3);
yr=R*ones(length,width);
yg=G*ones(length,width);
yb=B*ones(length,width);

y=cat(3,yr,yg,yb);