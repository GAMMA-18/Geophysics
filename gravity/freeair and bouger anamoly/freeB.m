%Assignment 2
%Sheet 4
ex=xlsread("Gravity Question_2024.xlsx","Sheet4");
len=11;
data=ex(5:len,:);
h=data(:,7);
g_obs=data(:,11);
% Sheet 5
% ex=xlsread("Gravity Question_2024.xlsx","Sheet5");
% len=24;
% data=ex(5:len,:);
% h=data(:,7);
% g_obs=data(:,11);
%
% %Sheet 6
% ex=xlsread("Gravity Question_2024.xlsx","Sheet6");
% len=23;
% data=ex(5:len,:);
% h=data(:,7);
% g_obs=data(:,15);
lat=data(:,1)+data(:,2)/60+data(:,3)/3600;
lam=(lat*pi)/180;
%given data
ge=978031.846; %in mGal
alp=.0053024;
bt=-.0000058;
rho=2.5;
%standered gravity value
gStand=ge.*(1+alp.*sin(lam).^2+bt.*sin(2*lam).^2);
%bouger plate,free air correction
Dg_b=.0419*rho.*h;
Dg_fa=.3086.*h;
%bouger,free air anomali
gBA=g_obs+(Dg_fa-Dg_b)-gStand;
gFA=g_obs+(Dg_fa)-gStand;
fprintf("the Bouger plate anamoly:\n");
fprintf("%f\n",gBA);


fprintf("the Free-air anamoly:\n");
fprintf("%f\n",gFA);
clear all;
