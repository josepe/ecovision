function y=generate_dark_image_2(comienzo,num_images)

for i=1:num_images
    bar=zeros(96); %change this parameter to create different size squares 
    file_index=num2str(i+comienzo-1+1000000);
    imwrite(bar/1.5,[ file_index(2:end) '.png'],'png');
end
y=i+comienzo
file_index