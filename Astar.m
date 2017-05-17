function [path] = Astar (map, initial, goal)
%INPUTS
%goal a 1x2 vector stating the x and y coordinates of the goal cell
%initial a 1x2 vector stating the x and y coordinated of the initial cell
%map a ixj binary matrix describing occupancy with 1
w=12;%cm, robot width
% map=inflate_map(map); %accounting for robot width in the map
msize=size(map);
h=[];%heuristic values of every cell. estimated as the straight distance between the goal and cell
for i=1:msize(1)
    for j=1:msize(2)
        h(i,j)=sqrt((i-goal(1))^2+(j-goal(2))^2);
        if map(i,j)==1
            h(i,j)=h(i,j)+1000;
        end
    end
end

open=[initial(1),initial(2),h(initial(1),initial(2)),-1,-1];
%open nodes,[X(x coordinate of the cell/column),Y( y coordinate of the
%cell/row),f(sum of weight of all previous nodes and included this+heuristic), x
%(previous cell),y (previous cell)]
closed=[];%explored nodes
[m n] = min(open(:,3));
current=open(n,:);

%open min and extract
while ~isequal(current(1:2),goal)
    children= expand_node(current,h, msize(1), msize(2));
    %place the children with the lower cost in the open list if they are
    %redundant in that list
    closed=[closed;current];
    open=open([1:n-1,n+1:end],:); %deleting the current element from the open
    if isempty(children)==0
        for i=1:length(children(:,1))
            if BinA(open(:,1:2),children(i,1:2))~=0 %if the child is already present in the open but with a more expensive cost
                if(children(i,3)<open(BinA(open(:,1:2),children(i,1:2)),3))
                    BinA(open(:,1:2),children(i,1:2))
                    open(BinA(open(:,1:2),children(i,1:2)),:)=children(i,:);
                end
            else
                if BinA(closed(:,1:2),children(i,1:2))==0
                    open=[open ; children(i,:)];
                else
                    if (children(i,3)<closed(BinA(closed(:,1:2),children(i,1:2)),3))
                        BinA(open(:,1:2),children(i,1:2));
                        closed(BinA(open(:,1:2),children(i,1:2)),:)=children(i,:);
                    end
                end
            end
        end
    end
    [m n] = min(open(:,3));
    current=open(n,:);
end
closed=[closed ;current];
%reiterate to start to find path
node=current;
path=current(1:2);
while ~isequal(node(4:5),initial)
    path=[node(4:5); path];
    node=closed(BinA(closed(:,1:2),node(4:5)),:);
end
path
end