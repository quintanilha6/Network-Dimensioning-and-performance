%Task 1
%------

capacity = 54*10^6;   %Mbps

tgap = 10*10^-6;      %sec

header = 36;          %bytes
fcs = 4;              %bytes

global const = header + fcs;   %bytes

%----
% 1 a

figure(1);
xlabel("Data Field Size")
ylabel("Link Data Rate")

data = linspace(100,8000,1000);

a = (data*8) / capacity;

b = ( ((data + const)*8) / capacity ) + tgap;

c = 54 * (a./b);

plot(data, c, 'b', "linewidth", 2)

%Conclusion: quanto mais pequeno o pacote a ser tranferido, menor o 
%            aproveitamento da capacidade de ligaçao


%----
% 1 b

figure(2);
xlabel("Bit Error Rate")
ylabel("Frame Discard Probability")

probability = logspace(-8, -3, 8000);

B = 100;  %bytes
discard = 1 - (1- probability).^((B+const)*8);
semilogx(probability, discard, ";100bytes;", "linewidth", 2)

hold on

B = 200;  %bytes
discard = 1 - (1- probability).^((B+const)*8);
semilogx(probability, discard, ";200bytes;", "linewidth", 2)

B = 1000;  %bytes
discard = 1 - (1- probability).^((B+const)*8);
semilogx(probability, discard, ";1000bytes;", "linewidth", 2)

B = 8000;  %bytes
discard = 1 - (1- probability).^((B+const)*8);
semilogx(probability, discard, ";8000bytes;", "linewidth", 2)

h = legend("location", "northwest");

hold off

% Conclusion: quanto maior o pacote maior a probabilidade de bit error, logo,
%             maior probabilidade de descarte do pacote


%----
% 1 c

figure(3)
xlabel("Bit Error Rate")
ylabel("Data Rate")

errorRate = logspace(-8, -3, 8000);

B = 100;  %bytes

a = (B*8) / capacity;
b = ( ((B + const)*8) / capacity ) + tgap;
accept = (1- errorRate).^((B+const)*8);
c = 54 * (a./b) * accept;

semilogx(errorRate, c, ";100bytes;", "linewidth", 2)

hold on

B = 200;  %bytes

a = (B*8) / capacity;
b = ( ((B + const)*8) / capacity ) + tgap;
accept = (1- errorRate).^((B+const)*8);
c = 54 * (a./b) * accept;

semilogx(errorRate, c, ";200bytes;", "linewidth", 2)

B = 1000;  %bytes

a = (B*8) / capacity;
b = ( ((B + const)*8) / capacity ) + tgap;
accept = (1- errorRate).^((B+const)*8);
c = 54 * (a./b) * accept;

semilogx(errorRate, c, ";1000bytes;", "linewidth", 2)

B = 8000;  %bytes

a = (B*8) / capacity;
b = ( ((B + const)*8) / capacity ) + tgap;
accept = (1- errorRate).^((B+const)*8);
c = 54 * (a./b) * accept;

semilogx(errorRate, c, ";8000bytes;", "linewidth", 2)

hold off

%Conclusion

%----
% 1 d

figure(4)
xlabel("Bit Error Rate")
ylabel("Data Rate Ponderado")

errorRate = logspace(-8,-3,8000);

B1 = 100;   %bytes
B2 = 1500;  %bytes

function result = dataRate (B, errorRate, capacity, const, tgap)
  a = (B*8) / capacity;
  b = ( ((B + const)*8) / capacity ) + tgap;
  accept = (1- errorRate).^((B+const)*8);
  result = 54 * (a./b) * accept;
  return;
endfunction

c = dataRate(B1, errorRate, capacity, const, tgap);
d = dataRate(B2, errorRate, capacity, const, tgap);

e = 0.3*c + 0.7*d;

semilogx(errorRate, e, "linewidth", 2)

% Conclusion:
%

%----
% 1 e

figure(5)



%-------
% Task 2
%-------

%----
% 2 a

figure(6)
