
%opomba
% izbrisi prvo vrstico iz .csv fajla -> HEADER

% za plottanje samo spremeni ime fajlov
% 1. plot je za nivo lacI mRNA v bakterijah
% 2. plot je za nivo AI (auto inducer) v bakterijah

%%%%%%%%%%%%%%%%%%%%%%%%%
%% PLOT lacI mRNA %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
Array=csvread('C:\Users\Matej\Desktop\lacI_ALL_100min_orig.csv');

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
xlabel('Simulacijski èas [s]') % x-axis label
ylabel('Nivo lacI mRNA v bakterijah') % y-axis label

hold off;

%%%%%%%%%%%%%%%%%%%%%%%%%
%% PLOT AI - autoInducer %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
Array2=csvread('C:\Users\Matej\Desktop\AI_internal_ALL_100min_orig.csv');

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
xlabel('Simulacijski èas [s]') % x-axis label
ylabel('Nivo AI v bakterijah') % y-axis label

hold off;


