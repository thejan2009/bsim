
% za plottanje samo dodaj poti do fajlov ob izvedbi. hint:
% BSimCoupledRepressilators jih ob koncu izvajanja izpise v stdout.

% 1. plot je za nivo lacI mRNA v bakterijah
% 2. plot je za nivo AI (auto inducer) v bakterijah

arg_list = argv();
lacl_file = arg_list{1};
AI_file = arg_list{2};

%%%%%%%%%%%%%%%%%%%%%%%%%
%% PLOT lacI mRNA %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
Array=csvread(lacl_file, 1, 0);


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
xlabel('Trajanje [s]') % x-axis label
ylabel('Nivo lacI mRNA v bakterijah') % y-axis label

hold off;

%%%%%%%%%%%%%%%%%%%%%%%%%
%% PLOT AI - autoInducer %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
Array2=csvread(AI_file, 1, 0);

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
xlabel('Trajanje [s]') % x-axis label
ylabel('Nivo AI v bakterijah') % y-axis label

hold off;


