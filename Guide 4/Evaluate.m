function CurrentObjective = Evaluate(CurrentSolution, miu, d, gama, nT, T)

  lambda = CurrentSolution.lambda;
  routes = CurrentSolution.routes;
  
  %%%% b)
  %%% (i) %%%
  soma = ( lambda./ ( miu - lambda ) ) + lambda.* d ;
  soma(isnan(soma)) = 0 ;

  W = (1/gama) * sum(sum(soma)) * 2 ;

  %%% (ii) %%%
  Ws = zeros(nT,1);

  for i=1:nT
    
    destination= T(i,2);
    r = routes(i,:);
    j = 1;
    
    while r(j) ~= destination
      Ws(i) = Ws(i) + ((1 / (miu(r(j),r(j+1)) - lambda(r(j),r(j+1)))) + d(r(j),r(j+1)));
      Ws(i) = Ws(i) + ((1 / (miu(r(j+1),r(j)) - lambda(r(j+1),r(j)))) + d(r(j+1),r(j)));
      j = j + 1; 
    end
    
  end
  
  CurrentObjective.w = W;
  CurrentObjective.ws = max(Ws);
  
end