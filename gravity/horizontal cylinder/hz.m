%%Assignment(4)
%gravitational anomaly(horizontal cylinder)
%given
R=30;
rho=.8;
z=[0,50,100,150,200,250];
x=linspace(-500,500);
G=6.67e-11;
6
for i=1:length(z);
g_max(i)=(2*pi*G*rho*R^2)/z(i);
x_hf(i)=z(i);
g_hf(i)=g_max(i)/2;
for j=1:length(x);
g(j)=(2*pi*G*rho*R^2*z(i))/(x(j)^2+z(i)^2);
end;
hold on;
plot(-x_hf(i),g_hf(i),"*");
plot(x,g);
text(-x_hf(i), g_hf(i),sprintf('z = %d', z(i)));
hold off;
end;
title("Gravitational anomaly(horizontal anomaly)");
xlabel("lateral extent");
ylabel("g_z");
grid on;