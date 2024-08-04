%%for burried sphere.
R=40;
rho=.8;
z=[50,100,150,200];
x=linspace(-500,500);
G=6.67e-11;
for i=1:length(z);
g_max(i)=(4*pi*G*R^3*rho)/(3*z(i)^2);
g_hf(i)=g_max(i)/2;
x_hf(i)=.766*z(i);
for j=1:length(x);
g(j)=(4*pi*G*R^3*rho*z(i))/(3*(x(j)^2+z(i)^2)^1.5);
end;
5
hold on;
plot(x,g);
plot(-x_hf(i),g_hf(i),"*");
text(-x_hf(i),g_hf(i),sprintf('z= %d',(z(i))));
hold off;
end;
title("Gravitational anomaly(sphere)");
xlabel("lateral veriation");
ylabel("g_z");
grid on;