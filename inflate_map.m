function [inflatedm]=inflate_map(map,w)
%potntial error in distances taken (+-1cm). But we are on the safe side so
%its fine.
i=length(map(:,1);j=length(map(1,:));
w=ciel(w/2)*2;
%inflate map boundaries
inflatedm=ones(i,j);
inflatedm(w/2+1:end-w/2,w/2+1:end-w/2)=0;
%inflate obstacles
for ii=w/2:i-w/2
    for jj=w/2:j-w/2
        if map(ii,jj)=1 %if the block is occupied
            inflatedm(ii-width/2:ii+width/2,jj-width/2:jj+width/2)=1;
        end
    end
end
