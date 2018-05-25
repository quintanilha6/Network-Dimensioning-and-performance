N = 5; %número de simulações
results= zeros(1,N); %vetor com os N resultados de simulação

for it= 1:N
  results(it)= simulator();
end

alfa= 0.1; %intervalo de confiança a 90%
media = mean(results);
termo = norminv(1-alfa/2)*sqrt(var(results)/N);
fprintf('resultado = %.2e +- %.2e\n',media,termo)


