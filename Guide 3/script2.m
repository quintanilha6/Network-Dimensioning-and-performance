%For all the cases A to P

% p -  percentage of requests for 4K movies (in %)

%        LAMBDA , SERVERS , Mbps , p%


cases = [   119 13 60 30 ];
            
            
        
alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';


alfa= 0.1; %intervalo de confiança a 90%
R = 50000;
REP = 10; %%% METER A 40

b = zeros(1,REP);
o = zeros(1,REP);

Mhd = 4; %throughput of hd format
M4k = 10; %throughput of 4k format

for i=1:size(cases,1)
     
    letter = alphabet(i);
    fprintf('Case %s\n', letter);
    
    
      for j=1:REP
          
        [b(j), o(j)] = simulator2( cases(i,1), cases(i,2), cases(i,3), cases(i,4), Mhd, M4k, R);
      end
      mediaBlockingProb = mean(b);
      BlockingProb4k = mean(o);
      termo1 = norminv(1-alfa/2)*sqrt(var(b)/REP);
      termo2 = norminv(1-alfa/2)*sqrt(var(o)/REP);
      fprintf('HD Blocking Probability = %.2e +- %.2e\n', mediaBlockingProb,termo1)
      fprintf('4K Blocking probability = %.2e +- %.2e\n\n', BlockingProb4k, termo2)

    
 end
    

