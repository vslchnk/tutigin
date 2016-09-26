%Разложение функции t^p в комплексный ряд Фурье
%в дискретизированном виде на интервале [0,T]
%Восстановление функции производится по формуле
% fв(i)=y(i)=sum(c(k)*exp(j*2*pi*0*i/N)), k=[1,M],  i= [0,N-1]
%Чем больше М, тем точнее восстановление

clc;
T=pi;%Значение T (произвольное)
N=1024;%количество значений функции на интервале [0,T]
M=6 ;%количество членов ряда Фурье
p=1;%показатель степени функции x^p 
kp=3;%количество периодов гармонического сигнала
fi=0.1 
C0=0;
for i=1:N+1 %генерация модельной функции
   f(i)=sin(2*pi*kp*(i-1)/N+fi); % гармоническая функция      
   C0=C0+f(i);
end

%
% i=1:(40);
% figure
% plot(i,f(i));
%  w=fft(f);
%  
% for i=1:M
% fft_res_real(i)=real(w(i));
% fft_res_imag(i)=imag(w(i));
% end
% rrr_real=fft_res_real
% rrr_imag=fft_res_imag
% real_res=fft_res_real(3);
% imag_res=fft_res_imag(3);
% fi_calc=atan(imag_res/real_res)
%

C0=C0*(2/N);
for k=1:M
   C(k)=0; 
end   
for i=1:N-1
    for k=1:M
    C(k)=C(k)+f(i)*exp(-j*2*pi*k*(i-1)/N);     
    end    
end
for k=1:M
C(k)=C(k)*(2/N);
fi_calc(k)=atan(imag(C(k))/real(C(k)));
end
result_fi=fi_calc(3)

pause
close all;
clear;