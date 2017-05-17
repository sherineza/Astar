function [Map,map,goal,start]= DejaMadeMap
map=zeros(ceil(rand*20+10),ceil(rand*20+10));
sizemap=size(map);
start=[ceil(rand*sizemap(1)/2) ceil(rand*sizemap(2)/2)];
goal=[ceil(rand*sizemap(1)/2+sizemap(1)/2) ceil(rand*sizemap(2)/2+sizemap(1)/2)];
for i=1:20 %number of obstacle points
    map(ceil(rand*sizemap(1)) ,ceil(rand*sizemap(2)))=1;
end

%Visualize
Vertical = sizemap(1);
Horizontal =sizemap(2);
%Generate Map as BW Image Every Grid is a 10x10 pixel square bordered by a
%1 pixel black line
%Generating one block
i = [0 ones(1,10) 0];
Block = [ zeros(1,12); i;i;i;i;i;i;i;i;i;i;zeros(1,12)];
Map=[];X=[];Y=[];
for i = 1:Vertical
    Map = [Map;Block];
    Y=[Y; 12*(i-1)+6];
end
Strip=Map;
for i = 1:Horizontal-1
    Map = [Map Strip];
    X=[X; 12*(i-1)+6];
end
[x,y]=find(map);
for k=1:length(x)
    [ii i] = min(abs(X-y(k)*12));
    [jj j] = min(abs(Y-x(k)*12));
    Map(Y(j)-5:Y(j)+6,X(i)-5:X(i)+6)=0;
end
[ii i] = min(abs(X-start(2)*12));
[jj j] = min(abs(Y-start(1)*12));
Map(Y(j)-1:Y(j)+2,X(i)-1:X(i)+2)=0;
start = [j,i];
[ii i] = min(abs(X-goal(2)*12));
[jj j] = min(abs(Y-goal(1)*12));
Map(Y(j)-2:Y(j)+3,X(i)-2:X(i)+3)=0;
goal = [j,i];
end
