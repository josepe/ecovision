function y=embed_matrix_RGB(larger,smaller,upperleft)

%embeds a small color image into a larger one 
%create large zeros matrix

dy=size(smaller,1);
dx=size(smaller,2);
%split

y=larger;
y(upperleft(1):upperleft(1)+dy-1,upperleft(2):upperleft(2)+dx-1,:)=smaller;
