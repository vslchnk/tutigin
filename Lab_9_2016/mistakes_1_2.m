%Вычисление математического ожидания
% General model Gauss2 (instead of Gauss1):
%        f(x) =  a1*exp(-((x-b1)/c1)^2) + a2*exp(-((x-b2)/c2)^2)
% Coefficients (with 95% confidence bounds):
       a1 =       4.367;  
       b1 =      0.6666;  
       c1 =      0.1565;  
       a2 =      -1.273;  
       b2 =      0.8046;  
       c2 =     0.09106;  
for i=1:100
x(i)=i*0.01;
y(i)=1.56*(a1*exp(-((x(i)-b1)/c1)^2)+a2*exp(-((x(i)-b2)/c2)^2));
%множитель 1.56 для нормировки интеграла, площадь под кривой д.б. равна 1.
z1(i)=x(i)*y(i);
if x(i)<0.85 %интегрировать будем только от порога идентификации
  z1(i)=0;  
end    
end
i=1:100;
%MO_Gauss2=mean(y)
figure
plot (x,y);
title('Gauss2')
int1=trapz(x,z1);
Gauss_2_=int1



% General model Weibull:
%        f(x) = a*b*x^(b-1)*exp(-a*x^b)
% Coefficients (with 95% confidence bounds):
        a =       2.948;  
        b =       87.93;  
for i=1:100
x(i)=0.8+i*0.002;
y(i)=1.099*(a*b*x(i)^b*exp(-(a*x(i)^b)));%множитель 1.099 для нормировки интеграла
%площадь под кривой д.б. равна 1.
z2(i)=x(i)*y(i);
if x(i)>0.85 %интегрировать будем только до порога идентификации
  z2(i)=0;  
end   
end
figure
plot (x,y);
title('Weibull')
int2=trapz(x,z2);
Weibull_=int2
%MO_Weibull=mean(y)

pause;
close all;
clear;


