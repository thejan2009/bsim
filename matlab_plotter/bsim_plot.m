
%opomba
% izbrisi prvo vrstico iz .csv fajla -> HEADER

% za plottanje samo spremeni ime fajlov
% 1. plot je za nivo lacI mRNA v bakterijah
% 2. plot je za nivo AI (auto inducer) v bakterijah

%%%%%%%%%%%%%%%%%%%%%%%%%
%% PLOT lacI mRNA %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%

%%% ANA %%%
% graphics_toolkit('gnuplot')
% setenv('GNUTERM','X11')

%Array=csvread('C:\Users\Matej\Desktop\lacI_ALL_100min_orig.csv');
Array=csvread('/Users/Ana/Documents/Sola/Faks/2s/1l/NPMP/Projekt2/BSim/results/2017-12-21_23-01-55/lacI_ALL.csv');

%disp(Array);
simTime = size(Array, 1);
disp(simTime);
numOfCells = size(Array, 2) - 2; % -2 --> time col and lacI col
disp(numOfCells);

steps = Array(:, 1); %time steps od 1 do simTime (nastimas v Bsim intelliJ)
celice = Array(1:simTime, 3:end); %cell data
%disp(celice);

hold on;
for i = 1:numOfCells
    plot(steps, celice(:,i), 'color', rand(1,3));
end
title('Represilator - simulacija')
xlabel('Simulacijski cas [s]') % x-axis label
ylabel('Nivo lacI mRNA v bakterijah') % y-axis label

print -color -depsc mRNA.eps % export slike
hold off;

%%%%%%%%%%%%%%%%%%%%%%%%%
%% PLOT AI - autoInducer %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
%Array2=csvread('C:\Users\Matej\Desktop\AI_internal_ALL_100min_orig.csv');
Array2=csvread('/Users/Ana/Documents/Sola/Faks/2s/1l/NPMP/Projekt2/BSim/results/2017-12-21_23-01-55/AI_internal_ALL.csv');

%disp(Array);
simTime = size(Array2, 1);
disp(simTime);
numOfCells = size(Array2, 2) - 2; % -2 --> time col and AI col
disp(numOfCells);

steps = Array2(:, 1); %time steps od 1 do simTime (nastimas v Bsim intelliJ)
celice = Array2(1:simTime, 3:end); %cell data
%disp(celice);

figure;
hold on;
for i = 1:numOfCells
    plot(steps, celice(:,i), 'color', rand(1,3));
end
title('Represilator - simulacija')
xlabel('Simulacijski cas [s]') % x-axis label
ylabel('Nivo AI v bakterijah') % y-axis label

print -color -depsc AI.eps
hold off;


