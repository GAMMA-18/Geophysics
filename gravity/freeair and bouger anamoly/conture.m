%%Assignment(3)
% Bouger and Free air anomaly contour plot
clc;close all;clear all;
data=xlsread("");
lat=data(:,1);
long=data(:,2);
BA=data(:,3);
fa=data(:,4);
%make mase grid
num_lat=unique(lat);
num_long=unique(long);
[long_grid,lat_grid]=meshgrid(num_long,num_lat);
baAno=griddata(long,lat,BA,long_grid,lat_grid);
faAno=griddata(long,lat,fa,long_grid,lat_grid);
%subplot
subplot(1,2,1);
contourf(long_grid,lat_grid,baAno);
title("Bouger anomaly");
xlabel("longitude");
ylabel("latitude");
grid on;
colorbar;
subplot(1,2,2);
4
contourf(long_grid,lat_grid,faAno);
title("Free Air anomaly");
xlabel("longitude");
ylabel("latitude");
colorbar;
grid on;
