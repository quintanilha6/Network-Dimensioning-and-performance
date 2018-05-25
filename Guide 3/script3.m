
R = 50000;

Mhd = 4; %throughput of hd format
M4k = 10; %throughput of 4k format

% i = nr of servers , Starting on 10
for i=11:25 
        % j = w going always from 0 to 200 jumping 20
        for j=0:20:200 
          
         % case with lambda always 119 , servers , W , p  
        cases = [ 119 i j 30 ];  
        [b, o] = simulator2( cases(1), cases(2), cases(3), cases(4), Mhd, M4k, R);
        
        
            % if the difference between the two formats is smaller than 0.1
            if abs(o-b) <= 0.1 
                
                %simulation with one less server (server failure)
                [x, y] = simulator2( cases(1), cases(2)-1, cases(3), cases(4), Mhd, M4k, R);
                
                % if the difference between the two formats with 1 less server is smaller than 1
                if abs(y-x) <= 1
                    
                fprintf('Servers: %d \n', i)
                fprintf('W: %d \n', + j)
                fprintf('HD Blocking Probability = %.6e\n', b)
                fprintf('4K Blocking probability = %.6e\n\n', o)
                
                
                fprintf('Servers: %d \n', i-1)
                fprintf('W: %d \n', + j)
                fprintf('HD Blocking Probability = %.6e\n', x)
                fprintf('4K Blocking probability = %.6e\n\n', y)

                fprintf('---------------------------\n\n')
                end
            end
        
      end
      
end
     
    
 
    