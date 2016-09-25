%Программа построения функции коэффициентов 
%корреляции "свой-свой"
clear;
a = 4.288;  %коэффициенты функций распределения определены в программе подгонки кривых
b = 0.6454;  
c = 0.132;  
a1 = 0.4322;  
b1 = 0.9855;  
c1 = 0.01191;  
a2 = 4.436e+004;  
b2 = 20.58;  
c2 = 5.184; 
a3 = 3.784;
b3 = 110.9;

for i=1:102
   x(i)=(i-1)*0.01; 
   f1(i) =  a*exp(-((x(i)-b)/c)^2);
  % f2(i) =100* ( a1*exp(-((x(i)-b1)/c1)^2) + a2*exp(-((x(i)-b2)/c2)^2));
    f2(i) = a3*b3*x(i)^(b3-1)*exp(-a3*x(i)^b3);
    zero(i)=0;
end
 
figure
i=1:102;
plot(x(i),f1(i),'r-');
hold on; 
plot(x(i),f2(i),'b-');
grid on;
hold off;
axis tight;
title('Вероятность идентификации. Своего-синий, чужого-красный');
legend;
i=87:95;
df(i)=f2(i)-f1(i);
figure
plot(x(i),f2(i),'b-');
title('Область вблизи порога идентификации');
hold on
plot(x(i),f1(i),'r-');
plot(x(i),zero(i),'black-');
grid on;
axis tight;
hold off;
pause;
close all;
clear;