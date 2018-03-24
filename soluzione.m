%% Istruzioni
%1) Eseguire lo script genera_dati.m
%2) Inserire in questo script il codice necessario per rispondere alle 
%   domande di ciascun esercizio, seguendo anche le istruzioni riportare 
%   per ciascuna domanda. Alla fine del lavoro lo script deve essere 
%   eseguibile e produrre tutti i risultati ottenuti.
%3) Per ciascun esercizio e ciascuna domanda, la variabile preimpostata a
%   [] deve essere inizializzata con il comando finale che produce il
%   risultato voluto.
%4) Non modificare i nomi delle variabili pre-impostate e non creare
%   variabili con lo stesso nome in altre parti dello script.
%5) Terminata l'implementazione del codice, eseguire lo script al fine di
%   generare il file .mat di output.
%6) Se non si � in grado di rispondere ad una specifica domanda, mantenere
%   [] come risposta in modo che lo script possa essere eseguito ugualmente.
%7) In caso di alterazione accidentale dei dati generati dallo script
%   genera_dati.m eseguire nuovamente lo script tenendo presente che tutti
%   i dati nella workspace andranno persi.

%% Esercizio 1

% Domanda 1
a01_mu_hat=[];
a01_mu_hat(1,1)=mean(data(:,1));
a01_mu_hat(1,2)=mean(data(:,2));
a01_mu_hat(1,3)=mean(data(:,3));

a02_sigma_hat=[];
a02_sigma_hat = cov(data);

% Domanda 2
% Inserire il valore 1 per la coppia velocit� vento e temperatura, il
% valore 2 per la coppia velocit� vento e PM10, il valore 3 per la coppia
% temperatura e PM10.

corre = [corr(data(:,1),data(:,2)) corr(data(:,1),data(:,3)) corr(data(:,2),data(:,3))];
[correMax,correIndex] = max(corre);

a03=[correIndex];

% Domanda 3
%rmse wind
y_pm10_dato_wind = zeros(50,1);
A = sigma(1,3)/sigma(1,1);
rmse_wind=0;
for i=1:size(data)
    y_pm10_dato_wind(i) = mu(3) + A*(data(i,1) - mu(1));
    rmse_wind = rmse_wind + (data(i,3) - y_pm10_dato_wind(i))^2;
end

rmse_wind = sqrt(1/size(data,1) * rmse_wind);

%oppure con fitlm
f_31 = fitlm(data(:,1),data(:,3));

a04_rmse_wind=[rmse_wind];

%rmse wind and temperature

y_pm10_dato_wind_e_t = zeros(50,1);
A = [sigma(1,3)/sigma(1,1) sigma(2,3)/sigma(2,2)];
rmse_wind_e_t=0;
for i=1:size(data)
    %[data(i,1) data(i,2)] - [mu(1) mu(2)]
    y_pm10_dato_wind_e_t(i) = mu(3) + A*([data(i,1) data(i,2)] - [mu(1) mu(2)])';
    rmse_wind_e_t = rmse_wind_e_t + (data(i,3) - y_pm10_dato_wind_e_t(i))^2;
end

rmse_wind_e_t = sqrt(1/size(data,1) * rmse_wind_e_t);
a05_rmse_wind_temperature=[rmse_wind_e_t];

% Inserire il valore 1 se conviene utilizzare la sola informazione sul
% vento oppure il valore 2 se conviene utilizzare l'informazione di vento e
% temperatura.

a06=[1];

% Inserire il valore 1 se la matrice di varianza-covarianza non cambia,
% inserire il valore 2 se la matrice non � pi� definita positiva, inserire
% il valore 3 se una varianza cambia, inserire 4 se nessuna delle
% precedenti risposte � vera
a07=[3];

%% Esercizio 2
%Domanda 1

X=[ones(50,1) data(:,[1 2])];
Y=data(:,[3]);

%vedo se ci sono delle colonne ridondanti calcolando il det(X'X)
%det(X'*X)
%essendo che il det � diverso da 0 allora 

%Manualmente formula p4 regress_lin
%beta_hat=inv(X'*X)*X'*Y;
[beta_hat,bint,r,rint,stats] = regress(Y,X);
a08_beta_hat=[beta_hat];

%Domanda 2
%Manualmente formula p15 regress_lin
d_res = sum(r.^2);
degrees_of_freedom = (size(data,1)-size(beta_hat,1));
s2= d_res/degrees_of_freedom;

%https://it.mathworks.com/matlabcentral/answers/135229-in-the-regress-function-what-is-the-estimate-of-the-error-variance-returned-within-stats
%s2=stat(4);
a09_sigma2_eps=[s2];

%Domanda 3
%Manualmente formula p21
s=sqrt(s2);
y=beta_hat(1)+beta_hat(2)*10+beta_hat(3)*20;
a10_ci=[y+[1 -1]*tinv(0.05/2, degrees_of_freedom)*s*sqrt(1+[1 10 20]*inv(X'*X)*[1 10 20]')]; %vettore 2x1

%Domanda 4
%Inserire il valore 1 in caso di risposta negativa e 2 in caso di
%risposta positiva
a11=[2];

save(['SMS2_prova0_',num2str(matricola),'.mat']);