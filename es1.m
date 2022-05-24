% https://virtuale.unibo.it/pluginfile.php/1230278/mod_folder/content/0/Esercitazione_IntegrazioneNumerica_new.pdf?forcedownload=1
clc
clear all

f = @(x) x.^10;
% f = @(x) log(x+1);
% f = @(x) asin(x);

a = 0;
b = 1;
iEsatto = integral(f, a, b);
n = 9;
trapezi = zeros(n, 1);
simpson = zeros(n, 1);
errTrap = zeros(n, 1);
errSimp = zeros(n, 1);

for k = 1:n
    N(k) = 2^(k-1);
    trapezi(k) = trapeziComp(f, a, b, N(k));
    simpson(k) = simpsonComp(f, a, b, N(k));
    
    errTrap(k) = abs(iEsatto - trapezi(k)) / abs(iEsatto);
    errSimp(k) = abs(iEsatto - simpson(k)) / abs(iEsatto);
end

figure
semilogy(N, errTrap, 'r-', N, errSimp, 'b-')
legend('Errore Trapezi', 'Errore Simpson')