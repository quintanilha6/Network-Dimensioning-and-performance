function o= AverageConnectedNodePairs(N,L, nAP)
%Computes a value �o� with the percentage number of connected node pairs based 
%on the input matrix �L� of node pairs with direct links (see Section 4).

o = 0;

arrayAlg = [zeros(1,N) ones(1,nAP)];
repeat = 1;
counter = 0;


%Labelling Algorithm for Connectivity Computation
while repeat == 1
  
  repeat = 0;
  
  for i = 1:size(L,1)
    
    if arrayAlg(L(i,1))~= arrayAlg(L(i,2))
      arrayAlg(L(i,1)) = 1;
      arrayAlg(L(i,2)) = 1;
      repeat = 1;
    end
  end
end

  
% Counter = nr de pontos com acesso ´a internet
for h = 1 : N
  if arrayAlg(h) == 1
    counter = counter + 1;
   end
end
  
o = (counter / N) * 100;
 

end



