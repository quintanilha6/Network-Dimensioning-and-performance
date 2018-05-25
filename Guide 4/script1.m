Matrizes; %load matrizes
miu= R*1e9/(8*1000); %capacidade convertida
NumberLinks= sum(sum(R>0)); %valor de ligacoes unidirecionais
T(:,3:4)= T(:,3:4)*1e6/(8*1000); %mbs para pacotes por segundo
gama= sum(sum(T(:,3:4)));  
d= L*1e3/2e8;   % matrix de atrasos de propagacao 
nT= size(T,1);  %nr de pares origem/destino
lambda= zeros(20);  % nr pacotes/s que passa em cada percurso
routes= zeros(nT,20);   % percursos escolhidos 


for i=1:nT
    origin= T(i,1);
    destination= T(i,2);
    lambda_od= T(i,3); %origem->destino
    lambda_do= T(i,4); %destino->origem
    r= ShortestPathSym(d,origin,destination);
    routes(i,:)= r;
    j= 1;
    
    %actualiza o lambda para os valores do shortest path
    while r(j)~= destination
        lambda(r(j),r(j+1))= lambda(r(j),r(j+1)) + lambda_od;
        lambda(r(j+1),r(j))= lambda(r(j+1),r(j)) + lambda_do;
        j= j+1;
    end
end


Load= lambda./miu; 
Load(isnan(Load))= 0;
MaximumLoad = max(max(Load))
AverageLoad = sum(sum(Load))/NumberLinks