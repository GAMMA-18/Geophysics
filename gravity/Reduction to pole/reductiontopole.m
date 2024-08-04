data = xlsread("magData20_03_2024.xlsx");
La = data(:, 3);
Lo = data(:, 5);
mag = data(:, 6);
A = data(:, 11);

% Plotting
% Make meshgrid
n = 1000;
u = linspace(min(Lo), max(Lo), n);
v = linspace(min(La), max(La), n);
[X, Y] = meshgrid(u, v);
%hilbart transform
Q1=abs(hilbert(A));
Q2=abs(hilbert(Q1'));
Q=Q2';

% Use A directly
w = griddata(Lo, La, A, X, Y, "V4");

contourf(X, Y, w, 'ShowText', 'on');
xlabel('Longitude (Degree)');
ylabel('Latitude (Degree)');
title('Magnetic Anomaly after RTP (nT)');
colorbar;

