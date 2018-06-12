function CurrentObjective = EvaluateH(CurrentSolution, miu, d, gama, nT, T)

  lambda = CurrentSolution.lambda;
  routes = CurrentSolution.routes;
  
  %%%% b)
  %%% (i) %%%
  soma = ( lambda./ ( miu - lambda ) ) + lambda.* d ;
  soma(isnan(soma)) = 0 ;

  W = (1/gama) * sum(sum(soma)) * 2 ;

  %%% (CARGA) %%%
  
  Load= lambda./miu; 
  Load(isnan(Load))= 0;
  MaximumLoad = max(max(Load));
  
  CurrentObjective.w = W;
  CurrentObjective.MaximumLoad = MaximumLoad;
  
end