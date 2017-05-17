function [map,goal,initial]= DejaMadeMap
initial =[2 2];
goal=[120 240];
map = zeros(120,240);
for i=1:10
    map(ceil(rand(50)*20 + 40),ceil(rand(50)*20+100))=1; 
end