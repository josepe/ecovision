%counts pics in directory, moves files and renames to concatenate into a
%movie.

newdir ='../newmovie';
start_number=000000;
dirz=dir('*.png');
n=length(dirz);
for i=1:n
file_index=num2str(i+start_number+100000);
destination = [newdir file_index(2:end) '.png'];
copyfile(dirz(i).name,destination)
end