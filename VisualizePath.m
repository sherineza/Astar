function [map] = VisualizePath (path, map)
x=[];y=[];
for i=1:length(path(:,1))-1
    x(i)=6+(path(i,1)-1)*12;
    y(i)=6+(path(i,2)-1)*12;
    map(x(i)-3:x(i)+3,y(i)-3:y(i)+3)=0.5;
end
imshow(map);
end
