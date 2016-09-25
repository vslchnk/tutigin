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
%f1(1)=-1;
figure
i=1:102;
axis([0.4,0.99,-1,40])
hPlot=plot(x(i),f1(i),'r-');
set( hPlot, 'LineWidth', 3 );
hold on;
%semilogy(x(i),f1(i),'r-');
hPlot=plot(x(i),f2(i),'b-');
set( hPlot, 'LineWidth', 3 );
grid on;
hold off;
axis tight;
title('Вероятность идентификации. Своего-синий, чужого-красный');
legend;
i=80:98
df(i)=f2(i)-f1(i)
figure
%hPlot=plot(x(i),df(i));
hPlot=plot(x(i),f2(i),'b-');
set( hPlot, 'LineWidth', 3 );
title('Свой-синий, чужой-красный , порог идентификации- синий=красному');
hold on
hPlot=plot(x(i),f1(i),'r-');
set( hPlot, 'LineWidth', 3 );
hPlot=plot(x(i),zero(i),'black-');
set( hPlot, 'LineWidth', 3 );
grid on;
hold off;
pause;
close all;
clear;