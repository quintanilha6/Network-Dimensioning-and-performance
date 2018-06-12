Matrizes; % load matrizes
miu= R*1e9/(8*1000); % capacidade convertida
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
MaximumLoad = max(max(Load));
fprintf('MaximumLoad = %.4f\n', MaximumLoad)
AverageLoad = sum(sum(Load))/NumberLinks;
fprintf('AverageLoad = %.4f\n\n', AverageLoad)

% 2.b 
%(i)
soma = (lambda ./ (miu - lambda)) + lambda .* d;
soma(isnan(soma))= 0;
w = (1/gama) *  sum(sum(soma)) * 2;   % w = average round-trip delay

%(ii)
ws= zeros(nT,1);
for i=1:nT
    origin= T(i,1);
    destination= T(i,2);
    lambda_od= T(i,3); %origem->destino
    lambda_do= T(i,4); %destino->origem
    r= routes(i,:);
    j= 1;
    
    while r(j)~= destination
        ws(i) = ws(i) + (1 / (miu(r(j),r(j+1)) - lambda(r(j),r(j+1)))) + d(r(j),r(j+1));
        ws(i) = ws(i) + (1 / (miu(r(j+1),r(j)) - lambda(r(j+1),r(j)))) + d(r(j+1),r(j));
        j = j + 1;
    end
end

max(ws);

%%%%% Alinea c) %%%%%
%%% (i) %%%
figure(1)
subplot(1,2,1)
ws = sort(ws, 'descend');

plot(ws)
grid on

%%% (ii) %%%
subplot(1,2,2)
a = Load(:);
a = sort(a, 'descend');
a = a(1:NumberLinks);

plot(a)
grid on







