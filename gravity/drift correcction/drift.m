%Assignment 1
% Drift correction
%rad exal file(sheet4);
data=xlsread("Gravity Question_2024.xlsx");
len=11;
t_min=data(5:len,8);
t_hour=data(5:len,9);
gVal=data(5:len,10);
% given
k=.1008;
BSabs=978716;
% %rad exal file(sheet5);
% data=xlsread("Gravity Question_2024.xlsx","sheet5");
% len=24;
% t_min=data(5:len,8);
% t_hour=data(5:len,9);
% gVal=data(5:len,10);
% % given
% k=.1008;
% BSabs=978716;
%
%
% %rad exal file(sheet6);
% data=xlsread("Gravity Question_2024.xlsx","sheet6");
% len=23;
% t_min=data(5:len,8);
% t_hour=data(5:len,9);
% gVal=data(5:len,14);
% % given
% k=.1008;
% BSabs=978671.656;
%
len=length(gVal);
BS1=gVal(1);
BS2=gVal(len);
%operation
T=t_hour+t_min/60;
DR=(BS2-BS1)/(T(len)-T(1));
y=DR*T;
z4=BSabs-(BS1-gVal+y)*k;
fprintf("%f \n",z4);
clear all;