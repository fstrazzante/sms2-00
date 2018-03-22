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
%6) Se non si è in grado di rispondere ad una specifica domanda, mantenere
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
% Inserire il valore 1 per la coppia velocità vento e temperatura, il
% valore 2 per la coppia velocità vento e PM10, il valore 3 per la coppia
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

a06=[];

% Inserire il valore 1 se la matrice di varianza-covarianza non cambia,
% inserire il valore 2 se la matrice non è più definita positiva, inserire
% il valore 3 se una varianza cambia, inserire 4 se nessuna delle
% precedenti risposte è vera
a07=[3];

%% Esercizio 2
%Domanda 1

beta_hat=inv(data(:,[1 2])'*data(:,[1 2]))*data(:,[1 2])'*data(:,[3]);

a08_beta_hat=[beta_hat];



%Domanda 2
a09_sigma2_eps=[];

%Domanda 3
a10_ci=[]; %vettore 2x1

%Domanda 4
%Inserire il valore 1 in caso di risposta negativa e 2 in caso di
%risposta positiva
a11=[];

save(['SMS2_prova0_',num2str(matricola),'.mat']);