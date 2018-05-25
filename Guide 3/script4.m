
R = 10000;

Mhd = 4; %throughput of hd format
M4k = 10; %throughput of 4k format


p = 20; % 20% of requests are HD

subscribers = 10*3000 + 24*1500;
% requests per hour
lambda = 2 / (24 * 7);  % 2 request / 24h * 7days
lambda = lambda * subscribers;

limit_servers = 100;
limit_w = 1200;

Mhd = 4; %throughput of hd format
M4k = 10; %throughput of 4k format

for i=50:limit_servers
      for j=500:20:limit_w
          
        [b, o] = simulator2( lambda, i, j, p, Mhd, M4k, R);
        if (o <= 1 && b <= 1)
            fprintf('Servers: %d \n', i)
            fprintf('W: %d \n', + j)
            fprintf('HD Blocking Probability = %.2e \n', b)
            fprintf('4K Blocking probability = %.2e \n\n', o)
        end
      end
      
      
      

    
 end
    