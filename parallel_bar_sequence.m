function st=parallel_bar_sequence(st)

distance=st.halftravel;
st.parallel_distance=distance;

%compute number of images (step size)
%total distance = 
travel=2*st.halftravel; %total distance for leading edge
pixstep=st.pixelsperstep;
width=st.dimensions(1);
Nframes=2*st.halftravel/pixstep;
%distance=st.parallel_distance;

for i=1:Nframes
    i
    st=generate_bar_parallel(st);
    file_index=num2str(i+1+1000000);
    imwrite(st.image,[ file_index(2:end) '.jpg'],'jpg');
    %st.parallel_distance=st.parallel_distance-5;
    if st.pos_along_path-5-width<-st.halftravel break, end
    st.pos_along_path = st.pos_along_path-5
end