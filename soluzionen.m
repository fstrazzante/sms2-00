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
a02_sigma_hat=[];

% Domanda 2
% Inserire il valore 1 per la coppia velocità vento e temperatura, il
% valore 2 per la coppia velocità vento e PM10, il valore 3 per la coppia
% temperatura e PM10.
a03=[];

% Domanda 3
a04_rmse_wind=[];
a05_rmse_wind_temperature=[];

% Inserire il valore 1 se conviene utilizzare la sola informazione sul
% vento oppure il valore 2 se conviene utilizzare l'informazione di vento e
% temperatura.
a06=[];

% Inserire il valore 1 se la matrice di varianza-covarianza non cambia,
% inserire il valore 2 se la matrice non è più definita positiva, inserire
% il valore 3 se una varianza cambia, inserire 4 se nessuna delle
% precedenti risposte è vera
a07=[];

%% Esercizio 2
%Domanda 1
a08_beta_hat=[];

%Domanda 2
a09_sigma2_eps=[];

%Domanda 3
a10_ci=[]; %vettore 2x1

%Domanda 4
%Inserire il valore 1 in caso di risposta negativa e 2 in caso di
%risposta positiva
a11=[];

save(['SMS2_prova0_',num2str(matricola),'.mat']);