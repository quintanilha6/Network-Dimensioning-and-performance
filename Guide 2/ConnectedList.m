function L= ConnectedList(N,pos,W,AP)
%Computes a matrix �L� of 2 columns with the node pairs (mobile and AP nodes) 
%such that their distance is not higher than W.

index=1;

for i = 1: N
    for j= i+1 : size(pos,1)
      if sqrt((pos(j,1)-pos(i,1))^2 + (pos(j,2)-pos(i,2))^2) <= W
        L(index,1)=i;
        L(index,2)=j;
        index = index+1;
      end
 
  end

end

end




