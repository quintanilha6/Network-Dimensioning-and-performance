function CurrentSolution = GreedyRandomized(nT, miu, d, T)


    lambda = zeros(20);
  for i=randperm(nT)
    aux = 1./(miu - lambda) + d;
    
    origin= T(i,1);
    destination= T(i,2);
    lambda_od= T(i,3);
    lambda_do= T(i,4);
    r= ShortestPathSym(aux,origin,destination);
    routes(i,:)= r;
    j= 1;
    
    while r(j)~= destination
      lambda(r(j),r(j+1))= lambda(r(j),r(j+1)) + lambda_od;
      lambda(r(j+1),r(j))= lambda(r(j+1),r(j)) + lambda_do;
      j= j+1;
    end
  end
  
  CurrentSolution.routes = routes;
  CurrentSolution.lambda = lambda;
end