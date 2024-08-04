
clc;close all;clear all;
data=xlsread("magData20_03_2024.xlsx");
lat=data(:,3);
long=data(:,5);
magValue=data(:,6);
h=data(:,7);
day=data(:,8);
month=1;
year=2015;
decimal_year=year+(month-1)/12+(day-1)/365.25;
magAnomaly=zeros;
% [XYZ,H,D,I,F] = igrfmagm(h,lat,lon,dyear,13)
for i=1:length(magValue);
[XYZ,H,D,I,F(i)]=igrfmagm(h(i),lat(i),long(i),decimal_year(i),13);
magAnomaly(i)=magValue(i)-F(i);
end;
11
%for contour plotting
%make grid line
num_lat = unique(lat);
num_long = unique(long);
[long_grid, lat_grid] = meshgrid(num_long, num_lat);
magAno=griddata(long, lat,magAnomaly, long_grid, lat_grid);
igrf=griddata(long, lat,F, long_grid, lat_grid);
magVal=griddata(long, lat,magValue, long_grid, lat_grid);
%subplotting
subplot(1,3,1);
contourf(long_grid,lat_grid,magVal);
title("Magnetic Value");
xlabel("longitude");
ylabel("latitude");
colorbar;
grid on;
subplot(1,3,2);
contourf(long_grid,lat_grid,igrf);
title("IGRF Value");
xlabel("longitude");
ylabel("latitude");
colorbar;
grid on;
subplot(1,3,3);
contourf(long_grid,lat_grid,magAno);
title("Magnetic Anomaly");
xlabel("longitude");
ylabel("latitude");
colorbar;
grid on;
clear all;
