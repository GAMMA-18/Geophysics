%%Assignment(5a)
% regional residual seperation
data=xlsread("boug_fa_contour.xlsx");
disp(data);
lat=data(:,1);
long=data(:,2);
BA=data(:,3);
G=[lat,long];
Gg=inv(G'*G)*G'; %from least square method
a_b=Gg*BA;
regionalAnomaly=G*a_b;
residualAnomlay=BA-regionalAnomaly;
%for contour plotting
%make grid line
num_lat = unique(lat);
num_long = unique(long);
[long_grid, lat_grid] = meshgrid(num_long, num_lat);
bougerAno=griddata(long, lat,BA, long_grid, lat_grid);
regAno=griddata(long, lat,regionalAnomaly, long_grid, lat_grid);
resioAno=griddata(long, lat,residualAnomlay, long_grid, lat_grid);
9
%subplotting
subplot(1,3,1);
contourf(long_grid,lat_grid,bougerAno);
title("Bouger Anomaly");
xlabel("longitude");
ylabel("latitude");
colorbar;
grid on;
subplot(1,3,2);
contourf(long_grid,lat_grid,regAno);
title("Regional Anomaly");
xlabel("longitude");
ylabel("latitude");
colorbar;
grid on;
subplot(1,3,3);
contourf(long_grid,lat_grid,resioAno);
title("Residual Anomlay");
xlabel("longitude");
ylabel("latitude");
colorbar;
grid on;
clear all;