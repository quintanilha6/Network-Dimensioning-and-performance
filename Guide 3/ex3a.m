G= [ 1 2
1 3
1 4
1 5
1 6
1 14
1 15
2 3
2 4
2 5
2 7
2 8
3 4
3 5
3 8
3 9
3 10
4 5
4 10
4 11
4 12
4 13
5 12
5 13
5 14
6 7
6 16
6 17
6 18
6 19
7 19
7 20
8 9
8 21
8 22
9 10
9 22
9 23
9 24
9 25
10 11
10 26
10 27
11 27
11 28
11 29
11 30
12 30
12 31
12 32
13 14
13 33
13 34
13 35
14 36
14 37
14 38
15 16
15 39
15 40
20 21];
% 5 servidores tier 1
n = max(max(G)) - 5;
N = 40;


% Matrix full of -1
I = zeros(40,40) -1;

% Iteration for all AS Tier 2 and 3
for i=6:size(I,2)
    
    % assigning label 0 to AS j
    I(i,i) = 0;
    
    for a=0:1
        % for each AS pair(i,j)
        for j=1:size(G,1)
            p1 = I(i,G(j,1));
            p2 = I(i,G(j,2));
            
            % if one AS has label a and the other AS has label –1
            if (p1 == a && p2 == -1)
                I(i,G(j,2)) = a+1;
            % assign label a+1 to the AS that has label –1
            elseif (p1 == -1 && p2 == a)
                I(i,G(j,1)) = a+1;
            end
            
        end
    end
    
end

%% gerar ILPU
% custos
C(6:15) = 10;
C(16:40) = 8;
% Minimize
fid = fopen('ex3_minimize.lp','wt');
fprintf(fid,'Minimize\n');
for i=6:40
    fprintf(fid,' + %f x%d',C(i),i);
end
% Subject to
fprintf(fid,'\nSubject To\n');
% Constrain (2)
for j=6:40
    for i=6:40
        if I(i,j) > -1
            fprintf(fid,' + y%d,%d',j,i);
        end
    end
    fprintf(fid,' =  1\n');
end
% Constrain (3)
for j=6:40
    for i=6:40
        if I(i,j) > -1
            fprintf(fid,' + y%d,%d - x%d <= 0\n',j,i,i);
        end
    end
end
% Binary
fprintf(fid,'Binary\n');
for i=6:40
    fprintf(fid,' x%d\n',i);
end
for j=6:40
    for i=6:40
        if I(i,j) > -1
            fprintf(fid,' y%d,%d\n',j,i);
        end
    end
end
fprintf(fid,'End\n');
fclose(fid);