function [i] = BinA (a, b)
i=0;
if isempty(a)~=1
    for n=1:length(a(:,1))
        if isequal(a(n,:),b)==1
            i=n;
            break;
        else
            i=0;
        end
    end
end
end

