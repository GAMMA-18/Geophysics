% %%Assignment(5)
%regional residual seperation
7
% lat=[23.05,23.071,23.071,23.05,23.06];
% lat=lat’;
% long=[86.292,86.292,86.38,86.38,86.33];
% long=long’;
% BA=[2,2.5,3.1,3.4,2.7];
% BA=BA’
clc;
BA=[2.0;2.5;3.1;3.4;2.7];
G=[23.05 86.292;23.071 86.292;23.071 86.38;23.05 86.38;23.06 86.33];
lat=G(:,1)';
long=G(:,2)';
Gg=(inv(G'*G))*G';
a_b=Gg*BA;
regionalAnomaly=G*a_b;
residualAnomaly=BA-regionalAnomaly;
%for plotting
plot(regionalAnomaly);
hold on;
plot(BA);
plot(residualAnomaly);
legend("regional Anomlay","bouger anomlay","residual anomlay")
text(4,.5,"g=ax+by+g_0");
hold off;
clear all;