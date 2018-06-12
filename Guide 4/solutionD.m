Matrizes;
miu= R*1e9/(8*1000);
NumberLinks= sum(sum(R>0));
T(:,3:4)= T(:,3:4)*1e6/(8*1000);
gama= sum(sum(T(:,3:4)));
d= L*1e3/2e8;
nT= size(T,1);
lambda= zeros(20);
routes= zeros(nT,20);


GlobalBest = struct('w', Inf, 'ws', Inf);

counter = 0;

while counter < 500

    CurrentSolution = GreedyRandomized(nT, miu,d, T);
    CurrentObjective= Evaluate(CurrentSolution, miu, d, gama, nT, T);
    
    repeat= true;
    
    while repeat
        NeighbourBest.w = Inf;
        NeighbourBest.ws = Inf;
        
        for i=1:size(CurrentSolution.routes,1)
            NeighbourSolution= BuildNeighbour(CurrentSolution,i, T, miu, d);
            NeighbourObjective= Evaluate(NeighbourSolution,  miu, d, gama, nT, T);
            
            if NeighbourObjective.w < NeighbourBest.w || (NeighbourObjective.w == NeighbourBest.w && NeighbourObjective.ws < NeighbourBest.ws)
                NeighbourBest = NeighbourObjective;
                NeighbourBestSolution= NeighbourSolution;
            end
        end
        
        if NeighbourBest.w < CurrentObjective.w || (NeighbourBest.w == CurrentObjective.w  &&  NeighbourBest.ws < CurrentObjective.ws)
            CurrentObjective= NeighbourBest;
            CurrentSolution= NeighbourBestSolution;
            
        else
            repeat= false;
        end
    end
    
    if CurrentObjective.w < GlobalBest.w || (CurrentObjective.w == GlobalBest.w && CurrentObjective.ws < GlobalBest.ws)
        GlobalBestSolution= CurrentSolution;
        GlobalBest= CurrentObjective;
        counter = 0;
    else
        counter = counter +1;
    end
    
end
        
        fprintf('GlobalBest W = %.9f\n', GlobalBest.w)
        fprintf('GlobalBest Ws = %.9f\n\n', GlobalBest.ws)

routes = GlobalBestSolution.routes;
lambda = GlobalBestSolution.lambda;
        
%%%%%%%% SOLUTION %%%%%%%%%%

fprintf('A)\n')

Load= lambda./miu; 
Load(isnan(Load))= 0;
MaximumLoad = max(max(Load));
fprintf('MaximumLoad = %.9f\n', MaximumLoad)
AverageLoad = sum(sum(Load))/NumberLinks;
fprintf('AverageLoad = %.9f\n', AverageLoad)

% 2.b 
%(i)
fprintf('B.i)\n')
soma = (lambda ./ (miu - lambda)) + lambda .* d;
soma(isnan(soma))= 0;
w = (1/gama) *  sum(sum(soma)) * 2;   % w = average round-trip delay
fprintf('W = %.9f\n', w)


%(ii)
fprintf('B.ii)\n')
ws= zeros(nT,1);
for i=1:nT
    origin= T(i,1);
    destination= T(i,2);
    lambda_od= T(i,3); %origem->destino
    lambda_do= T(i,4); %destino->origem
    r= GlobalBestSolution.routes(i,:);
    j= 1;
    
    while r(j)~= destination
        ws(i) = ws(i) + (1 / (miu(r(j),r(j+1)) - lambda(r(j),r(j+1)))) + d(r(j),r(j+1));
        ws(i) = ws(i) + (1 / (miu(r(j+1),r(j)) - lambda(r(j+1),r(j)))) + d(r(j+1),r(j));
        j = j + 1;
    end
end

fprintf('Ws = %.9f\n\n', max(ws))

% C
%%% (i) %%%
fprintf('C.i)\n')

figure(1)
subplot(1,2,1)
ws = sort(ws, 'descend');

plot(ws)
grid on

%%% (ii) %%%
fprintf('C.ii)\n')

subplot(1,2,2)
a = Load(:);
a = sort(a, 'descend');
a = a(1:NumberLinks);

plot(a)
grid on



