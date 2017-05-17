function [children]=expand_node (parent, h, V, H)
children=[];
for i=-1:1
    for j=-1:1
        if j~=0 && i~=0 && parent(1)+i>0 && parent(1)+i<=V && parent(2)+j>0 && parent(2)+j<=H
            c=parent(3)+1.4142+h(parent(1)+i,parent(2)+j)-h(parent(1),parent(2));
            if ((parent(1)+i)~=parent(4)|| (parent(2)+j)~=parent(5))% && (((j==0 || i==0) && j~=i)||(j~=0 && i~=0))
                children=[children; [parent(1)+i, parent(2)+j, c, parent(1),parent(2)]];
            end
        elseif (j==0 || i==0) && j~=i && parent(1)+i>0 && parent(1)+i<=V && parent(2)+j>0 && parent(2)+j<=H
            c=parent(3)+1+h(parent(1)+i,parent(2)+j)-h(parent(1),parent(2));
            if ((parent(1)+i)~=parent(4)|| (parent(2)+j)~=parent(5)) %&& (((j==0 || i==0) && j~=i)||(j~=0 && i~=0))
                children=[children; [parent(1)+i, parent(2)+j, c, parent(1),parent(2)]];
            end
        else
            
        end
    end
end
