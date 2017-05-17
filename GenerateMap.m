function [map, goal, start,grid]= GenerateMap(ver,hor)
% Show empty Map
%Size of Map
Vertical = ver;
Horizontal =hor;
%Generate Map as BW Image Every Grid is a 10x10 pixel square bordered by a
%1 pixel black line
%Generating one block
i = [0 ones(1,10) 0];
Block = [ zeros(1,12); i;i;i;i;i;i;i;i;i;i;zeros(1,12)];
Map=[];X=[];Y=[];
for i = 1:Vertical
    Map = [ Map;Block];
    Y=[Y; 12*(i-1)+6];
end
Strip=Map;
for i = 1:Horizontal-1
    Map = [Map Strip];
    X=[X; 12*(i-1)+6];
end
imshow(Map);
% Accept Click and Mark blocks
str='';start=[];goal=[];obst=[];

for iter=1:100000
    prompt='Enter Letter:(s for start, g for goal, o for obstacle, d for done)';
    str= input(prompt,'s');
    switch str
        case 's'
            if isempty(start)==0
                i=start(1);j=start(2);
                Map(Y(j)-1:Y(j)+2,X(i)-1:X(i)+2)=1;
            end
            [x y]=ginput(1);
            [ii i] = min(abs(X-x));
            [jj j] = min(abs(Y-y));
            Map(Y(j)-1:Y(j)+2,X(i)-1:X(i)+2)=0;
            imshow(Map);
            start = [j,i];
        case 'g'
            if isempty(goal)==0
                i=goal(1);j=goal(2);
                Map(Y(j)-2:Y(j)+3,X(i)-2:X(i)+3)=1;
            end
            [x y]=ginput(1);
            [ii i] = min(abs(X-x));
            [jj j] = min(abs(Y-y));
            Map(Y(j)-2:Y(j)+3,X(i)-2:X(i)+3)=0;
            imshow(Map);
            goal = [j,i];
        case 'd'
            if (length(start)==0 || length(goal)==0)
                'You MUST choose at least a start and goal position'
            else
                break;
            end
        case 'o'
            [x y]=ginput(1);
            [ii i] = min(abs(X-x));
            [jj j] = min(abs(Y-y));
            Map(Y(j)-5:Y(j)+6,X(i)-5:X(i)+6)=0;
            imshow(Map);
            obst = [obst;j,i];
        otherwise
            'Choose a Valid Letter (s, g, o, or d)'
    end
end
grid=Map;
map = zeros(Vertical, Horizontal);
for i = 1:length(obst(:,1))
    map(obst(i,1),obst(i,2))=1;
end
end

