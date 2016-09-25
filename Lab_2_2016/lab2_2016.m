% Разложение функции t в ряд Фурье
%в дискретизированном виде на интервале  [-T,T], например,[-pi,pi]  
clear all;
clc;
N=512; %Количество отсчетов (элементов массива y(t))
K=16; %Количество членов ряда Фурье
T=pi; %диапазон изменения функции f(i) равен +/-T
kp=4.1; %количество периодов гармонической функции
y=zeros(1,N+1);
Sa = zeros(1,K);
Sb = zeros(1,K);
p=2;% показатель степени функции t^p
f=zeros(1,N+1);
Sa0=0;

counter = 1;
for i=1:N+1
    
    % Заранее не знаем количесво N
    t=2*pi*(i-1)/N;
    
    f(i)=sin(kp * t);
    Sa0=Sa0+f(i);
    %x(i)=2*cos(kp * t / 2);
    
    %if(x(i) > 0)
    %    f(counter) = log(x(i));
    %    Sa0=Sa0+f(counter);
    %    counter = counter + 1;        
    %end          
end

%ПОЧЕМУ?
%N = counter - 2;

Sa0=Sa0/N; %вычисленный коэф. a0/2
%Saa0=pi^2/3 %%теоретически определенные коэф. а0/2 для функции t^2
for i=1:N+1
    for j=1:K
        Sa(j) = (Sa(j)+f(i)*cos((j)*2*pi*(i-1-N/2)/N));
        Sb(j) = (Sb(j)+f(i)*sin((j)*2*pi*(i-1-N/2)/N));        
    end
   
end
for j=1:K
    Sa(j)=Sa(j)*(1/(N/2));
    Sb(j)=Sb(j)*(1/(N/2));
   % Saa(j)= 4*(-1)^j/(j^2);%теоретически определенный коэф. аk для функции t^2
end
SSa=Sa; %коэффициенты ak
SSb=Sb; %коэффициенты bk4fi_res=atan(SSa(kp)/SSb(kp))
%SSaa=Saa %теоретически определенные коэф. аk для функции t^2 
i=1:K;
figure 
plot(i,Sa);
title('Коэффициенты Sa');
%Вычисление и отображение спектра амплитуд (начало)
for j=1:K 
Sab(j)=sqrt(Sa(j)^2+Sb(j)^2);
end
i=1:K;
figure 
%plot(i,Sab);
stem(Sab(1:K)); %вывод графика  дискретной последовательности данных
axis([1 8 -0.2 1.2]);%задание осей: [xmin xmax ymin ymax]
title('Амплитуды частотных составляющих спектра');
xlabel('Количество периодов')
axis tight;
%Вычисление и отображение спектра амплитуд (конец)
y=zeros(1,N+1);
for i=1:N+1
    for j=1:K
        y(i)= y(i)+Sa(j)*cos(j*2*pi*(i-1-N/2)/N)+Sb(j)*sin(j*2*pi*(i-1-N/2)/N);        
    end  
     y(i)=Sa0+y(i);
end
i=1:N+1;
size(i)
size(f)
figure
plot(i,f);
axis tight;
hold on;
plot(i,y,'r-')
hold off;

for i=1:N+1
  dy(i)=y(i)-f(i);%абсолютная погрешность восстановления
end
dy_proc=dy/max(f)*100;
CKO=std(dy);
CKO_proc=std(dy_proc)%СКО в процентах





pause;
close all;
clear;
