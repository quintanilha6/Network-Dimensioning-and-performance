A = [10 100 4];
B = [20 100 4];
C = [30 100 4];
D = [40 100 4];
E = [10 100 10];
F = [20 100 10];
G = [30 100 10];
H = [40 100 10];
I = [100 1000 4];
J = [200 1000 4];
K = [300 1000 4];
L = [400 1000 4];
M = [100 1000 10];
N = [200 1000 10];
O = [300 1000 10];
P = [400 1000 10];

alfa= 0.1; %intervalo de confiança a 90%
R = 50000;
REP = 10; %%% METER A 10

b = zeros(1,REP);
o = zeros(1,REP);

for i=1:16
    
    %CASE A
    if ( i == 1 )
      fprintf('CASE A:\n')
      for j=1:REP
        [b(j) o(j)] = simulator1( A(1), A(2), A(3), R);
      end
      mediaBlockingProb = mean(b);
      fprintf('Blocking Probability = %.2e\n', mediaBlockingProb)
      mediaAverageConnection = mean(o);
      fprintf('Avarage connecting occupation = %.2e\n', mediaAverageConnection)
      termo1 = norminv(1-alfa/2)*sqrt(var(b)/REP);
      termo2 = norminv(1-alfa/2)*sqrt(var(o)/REP);
      fprintf('Resultado = %.2e +- %.2e\n\n',termo1,termo2)
    end
    
    
    %CASE B
    if ( i == 2 )
      fprintf('CASE B:\n')
      for j=1:REP
        [b(j) o(j)] = simulator1( B(1), B(2), B(3), R);
      end
      mediaBlockingProb = mean(b);
      fprintf('Blocking Probability = %.2e\n', mediaBlockingProb)
      mediaAverageConnection = mean(o);
      fprintf('Avarage connecting occupation = %.2e\n', mediaAverageConnection)
      termo1 = norminv(1-alfa/2)*sqrt(var(b)/REP);
      termo2 = norminv(1-alfa/2)*sqrt(var(o)/REP);
      fprintf('Resultado = %.2e +- %.2e\n\n',termo1,termo2)
    end
    
    %CASE C
    if ( i == 3 )
      fprintf('CASE C:\n')
      for j=1:REP
        [b(j) o(j)] = simulator1( C(1), C(2), C(3), R);
      end
      mediaBlockingProb = mean(b);
      fprintf('Blocking Probability = %.2e\n', mediaBlockingProb)
      mediaAverageConnection = mean(o);
      fprintf('Avarage connecting occupation = %.2e\n', mediaAverageConnection)
      termo1 = norminv(1-alfa/2)*sqrt(var(b)/REP);
      termo2 = norminv(1-alfa/2)*sqrt(var(o)/REP);
      fprintf('Resultado = %.2e +- %.2e\n\n',termo1,termo2)
    end
    
    %CASE D
    if ( i == 4 )
      fprintf('CASE D:\n')
      for j=1:REP
        [b(j) o(j)] = simulator1( D(1), D(2), D(3), R);
      end
      mediaBlockingProb = mean(b);
      fprintf('Blocking Probability = %.2e\n', mediaBlockingProb)
      mediaAverageConnection = mean(o);
      fprintf('Avarage connecting occupation = %.2e\n', mediaAverageConnection)
      termo1 = norminv(1-alfa/2)*sqrt(var(b)/REP);
      termo2 = norminv(1-alfa/2)*sqrt(var(o)/REP);
      fprintf('Resultado = %.2e +- %.2e\n\n',termo1,termo2)
    end
    
    %CASE E
    if ( i == 5 )
      fprintf('CASE E:\n')
      for j=1:REP
        [b(j) o(j)] = simulator1( E(1), E(2), E(3), R);
      end
      mediaBlockingProb = mean(b);
      fprintf('Blocking Probability = %.2e\n', mediaBlockingProb)
      mediaAverageConnection = mean(o);
      fprintf('Avarage connecting occupation = %.2e\n', mediaAverageConnection)
      termo1 = norminv(1-alfa/2)*sqrt(var(b)/REP);
      termo2 = norminv(1-alfa/2)*sqrt(var(o)/REP);
      fprintf('Resultado = %.2e +- %.2e\n\n',termo1,termo2)
    end
    
    %CASE F
    if ( i == 6 )
      fprintf('CASE F:\n')
      for j=1:REP
        [b(j) o(j)] = simulator1( F(1), F(2), F(3), R);
      end
      mediaBlockingProb = mean(b);
      fprintf('Blocking Probability = %.2e\n', mediaBlockingProb)
      mediaAverageConnection = mean(o);
      fprintf('Avarage connecting occupation = %.2e\n', mediaAverageConnection)
      termo1 = norminv(1-alfa/2)*sqrt(var(b)/REP);
      termo2 = norminv(1-alfa/2)*sqrt(var(o)/REP);
      fprintf('Resultado = %.2e +- %.2e\n\n',termo1,termo2)
    end
    
    %CASE G
    if ( i == 7 )
      fprintf('CASE G:\n')
      for j=1:REP
        [b(j) o(j)] = simulator1( G(1), G(2), G(3), R);
      end
      mediaBlockingProb = mean(b);
      fprintf('Blocking Probability = %.2e\n', mediaBlockingProb)
      mediaAverageConnection = mean(o);
      fprintf('Avarage connecting occupation = %.2e\n', mediaAverageConnection)
      termo1 = norminv(1-alfa/2)*sqrt(var(b)/REP);
      termo2 = norminv(1-alfa/2)*sqrt(var(o)/REP);
      fprintf('Resultado = %.2e +- %.2e\n\n',termo1,termo2)
    end
    
    %CASE H
    if ( i == 8 )
      fprintf('CASE H:\n')
      for j=1:REP
        [b(j) o(j)] = simulator1( H(1), H(2), H(3), R);
      end
      mediaBlockingProb = mean(b);
      fprintf('Blocking Probability = %.2e\n', mediaBlockingProb)
      mediaAverageConnection = mean(o);
      fprintf('Avarage connecting occupation = %.2e\n', mediaAverageConnection)
      termo1 = norminv(1-alfa/2)*sqrt(var(b)/REP);
      termo2 = norminv(1-alfa/2)*sqrt(var(o)/REP);
      fprintf('Resultado = %.2e +- %.2e\n\n',termo1,termo2)
    end
    
    %CASE I
    if ( i == 9 )
      fprintf('CASE I:\n')
      for j=1:REP
        [b(j) o(j)] = simulator1( I(1), I(2), I(3), R);
      end
      mediaBlockingProb = mean(b);
      fprintf('Blocking Probability = %.2e\n', mediaBlockingProb)
      mediaAverageConnection = mean(o);
      fprintf('Avarage connecting occupation = %.2e\n', mediaAverageConnection)
      termo1 = norminv(1-alfa/2)*sqrt(var(b)/REP);
      termo2 = norminv(1-alfa/2)*sqrt(var(o)/REP);
      fprintf('Resultado = %.2e +- %.2e\n\n',termo1,termo2)
    end
    
    %CASE J
    if ( i == 10 )
      fprintf('CASE J:\n')
      for j=1:REP
        [b(j) o(j)] = simulator1( J(1), J(2), J(3), R);
      end
      mediaBlockingProb = mean(b);
      fprintf('Blocking Probability = %.2e\n', mediaBlockingProb)
      mediaAverageConnection = mean(o);
      fprintf('Avarage connecting occupation = %.2e\n', mediaAverageConnection)
      termo1 = norminv(1-alfa/2)*sqrt(var(b)/REP);
      termo2 = norminv(1-alfa/2)*sqrt(var(o)/REP);
      fprintf('Resultado = %.2e +- %.2e\n\n',termo1,termo2)
    end
    
    %CASE K
    if ( i == 11 )
      fprintf('CASE K:\n')
      for j=1:REP
        [b(j) o(j)] = simulator1( K(1), K(2), K(3), R);
      end
      mediaBlockingProb = mean(b);
      fprintf('Blocking Probability = %.2e\n', mediaBlockingProb)
      mediaAverageConnection = mean(o);
      fprintf('Avarage connecting occupation = %.2e\n', mediaAverageConnection)
      termo1 = norminv(1-alfa/2)*sqrt(var(b)/REP);
      termo2 = norminv(1-alfa/2)*sqrt(var(o)/REP);
      fprintf('Resultado = %.2e +- %.2e\n\n',termo1,termo2)
    end
    
    %CASE L
    if ( i == 12 )
      fprintf('CASE L:\n')
      for j=1:REP
        [b(j) o(j)] = simulator1( L(1), L(2), L(3), R);
      end
      mediaBlockingProb = mean(b);
      fprintf('Blocking Probability = %.2e\n', mediaBlockingProb)
      mediaAverageConnection = mean(o);
      fprintf('Avarage connecting occupation = %.2e\n', mediaAverageConnection)
      termo1 = norminv(1-alfa/2)*sqrt(var(b)/REP);
      termo2 = norminv(1-alfa/2)*sqrt(var(o)/REP);
      fprintf('Resultado = %.2e +- %.2e\n\n',termo1,termo2)
    end
    
    %CASE M
    if ( i == 13 )
      fprintf('CASE M:\n')
      for j=1:REP
        [b(j) o(j)] = simulator1( M(1), M(2), M(3), R);
      end
      mediaBlockingProb = mean(b);
      fprintf('Blocking Probability = %.2e\n', mediaBlockingProb)
      mediaAverageConnection = mean(o);
      fprintf('Avarage connecting occupation = %.2e\n', mediaAverageConnection)
      termo1 = norminv(1-alfa/2)*sqrt(var(b)/REP);
      termo2 = norminv(1-alfa/2)*sqrt(var(o)/REP);
      fprintf('Resultado = %.2e +- %.2e\n\n',termo1,termo2)
    end
    
    %CASE N
    if ( i == 14 )
      fprintf('CASE N:\n')
      for j=1:REP
        [b(j) o(j)] = simulator1( N(1), N(2), N(3), R);
      end
      mediaBlockingProb = mean(b);
      fprintf('Blocking Probability = %.2e\n', mediaBlockingProb)
      mediaAverageConnection = mean(o);
      fprintf('Avarage connecting occupation = %.2e\n', mediaAverageConnection)
      termo1 = norminv(1-alfa/2)*sqrt(var(b)/REP);
      termo2 = norminv(1-alfa/2)*sqrt(var(o)/REP);
      fprintf('Resultado = %.2e +- %.2e\n\n',termo1,termo2)
    end
    
    %CASE O
    if ( i == 15 )
      fprintf('CASE O:\n')
      for j=1:REP
        [b(j) o(j)] = simulator1( O(1), O(2), O(3), R);
      end
      mediaBlockingProb = mean(b);
      fprintf('Blocking Probability = %.2e\n', mediaBlockingProb)
      mediaAverageConnection = mean(o);
      fprintf('Avarage connecting occupation = %.2e\n', mediaAverageConnection)
      termo1 = norminv(1-alfa/2)*sqrt(var(b)/REP);
      termo2 = norminv(1-alfa/2)*sqrt(var(o)/REP);
      fprintf('Resultado = %.2e +- %.2e\n\n',termo1,termo2)
    end
    
    %CASE P
    if ( i == 16 )
      fprintf('CASE P:\n')
      for j=1:REP
        [b(j) o(j)] = simulator1( P(1), P(2), P(3), R);
      end
      mediaBlockingProb = mean(b);
      fprintf('Blocking Probability = %.2e\n', mediaBlockingProb)
      mediaAverageConnection = mean(o);
      fprintf('Avarage connecting occupation = %.2e\n', mediaAverageConnection)
      termo1 = norminv(1-alfa/2)*sqrt(var(b)/REP);
      termo2 = norminv(1-alfa/2)*sqrt(var(o)/REP);
      fprintf('Resultado = %.2e +- %.2e\n\n',termo1,termo2)
    end
end