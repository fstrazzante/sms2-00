clc
clear all

%Inserire il numero di matricola, nome e cognome
matricola=1040550;
nome='Francesco';
cognome='Strazzante';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% GENERAZIONE DATI. NON MODIFICARE                                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
RandStream.setGlobalStream(RandStream('mt19937ar','seed',matricola));

mu=[10 18 50];

if mod(matricola,2)==0
    sigma=[4.0  2.5 -2.5;
           2.5  5.0 -4.0;
          -2.5 -4.0  9.0];
else
    sigma=[4.0  2.5 2.5;
           2.5  5.0 1.0;
           2.5  1.0 9.0];
end
   
data=mvnrnd(mu,sigma,50);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%