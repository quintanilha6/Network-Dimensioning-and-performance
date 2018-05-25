function FinalResult = simulator()
%Parameters initialization:
#N= 50;       % Number of mobile nodes
#W= 40;       % Radio range (in meters)
#S= 3;        % Maximum speed (in Km/h)
delta= 1;    % Difference between consecutive time instants (in seconds)
T= 3600; %POR 3600 NO FIM!    % No. of time instants of the simulation

%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%  CASE A   %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%
#{
N = 50;
W = 40;
S = 3;
#}

%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%  CASE B   %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%
#{
N = 50;
W = 60;
S = 3;
#}

%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%  CASE C   %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%
#{
N = 50;
W = 80;
S = 3;
#}

%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%  CASE D   %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%
#{
N = 100;
W = 40;
S = 3;
#}

%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%  CASE E   %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%
#
N = 100;
W = 60;
S = 3;
#}

%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%  CASE F   %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%
#{
N = 50;
W = 40;
S = 6;
#}

%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%  CASE G   %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%
#{
N = 50;
W = 60;
S = 6;
#}

%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%  CASE H   %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%
#{
N = 50;
W = 80;
S = 6;
#}

%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%  CASE I   %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%
#{
N = 100;
W = 40;
S = 6;
#}

%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%  CASE J   %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%
#{
N = 100;
W = 60;
S = 6;
#}



% Coordinates of each AP
% 1 AP
AP = [150 100];   

% 2 APs
%AP = [75 100; 225 100]; 

% 3 APs
%AP = [50 100; 150 100; 250 100]; 

% 4 APs
%AP = [75 50; 75 150; 225 50; 225 150];   

nAP = size(AP,1);    %Number of APs
S= S/3.6;            % Conversion of maximum speed to m/s
results= zeros(1,T); % Initialization of the results array

plotar = 0;  % if plotar = 1, node movement is visualized
             % if plotar = 2, node movement and connectivity are visualized

% Generation of initial coordinates of each mobile node position and speed:
[pos,vel]= InitialRandom(N,S);

h= waitbar(0,'Running simulation...');
% Simulation cycle:
for iter= 1:T
    
    waitbar(iter/T,h);
    % Update coordinates of each mobile node position and speed:
    [pos,vel]= UpdateCoordinates(pos,vel,delta);
    
    
    % ADD APS TO ARRAY OF POINTS
    pos = [pos;AP];
    
    % Compute the node pairs with direct wireless links:
    L= ConnectedList(N,pos,W,AP);
    
    % Compute the percentage number of connected node pairs:
    results(iter)= AverageConnectedNodePairs(N,L,nAP);
    
    %Calcular media dos resultados
    average(iter) = mean(results(1:iter));
    
    
    % Visualization of the simulation:
    if plotar>0        
        visualize(AP,pos,L,plotar)
    end
    
    %Remove APS FROM ARRAY OF POINTS
    for x = 1:nAP
      pos(end,:) = [];
    end
    
end

#{
alfa= 0.1; %intervalo de confiança a 90%
media = mean(results);
termo = norminv(1-alfa/2)*sqrt(var(results)/N);
fprintf('resultado = %.2e +- %.2e\n',media,termo)
#}

delete(h)
% Plot the simulation results:
figure(2)
plot((1:T)',results')
hold on  %se nao tiver hold on o grafico fica todo estranho por alguma razao
plot((1:T)',average')
axis([0 T 0 110])
xlabel('Time (seconds)');
ylabel('No. of connected nodes (%)')

% Compute the final result: 
FinalResult= mean(results)





