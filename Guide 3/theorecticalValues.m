
%For all the cases A to P
cases = [   10 100 4;
            20 100 4;
            30 100 4;
            40 100 4;
            10 100 10;
            20 100 10;
            30 100 10;
            40 100 10;
            100 1000 4;
            200 1000 4;
            300 1000 4;
            400 1000 4;
            100 1000 10;
            200 1000 10;
            300 1000 10;
            400 1000 10];
alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

minutes = 86.3;
u = 1/minutes;  %1/u = 86.3 minutes

 for j=1:size(cases)
     
    letter = alphabet(j);
    fprintf('Case %s\n', letter);
    
    N=floor(cases(j,2)/cases(j,3));
    ro=(cases(j,1)/60)/(u);

    resultBlockingProbability = blockingProbability(N, ro) * 100;
    fprintf('Blocking Probability = %0.2f\n', resultBlockingProbability);
    
    resultAverageOccupacity = avgSystemOccupation(N, ro) * cases(j,3);
    fprintf('Avarage occupation = %0.2f\n\n', resultAverageOccupacity);
 end
