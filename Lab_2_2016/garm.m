% Разложение функции t в ряд Фурье
%в дискретизированном виде на интервале  [-T,T], например,[-pi,pi]  
clear all;
close all;

clc;
N=1024;% %Количество отсчетов (элементов массива y(t))
K=60; %Количество членов ряда Фурье
T=pi; %диапазон изменения функции f(i) равен +/-T
kp=4.1; %количество периодов гармонической функции

% CKO_procK=zeros(1,K);
% for i=1:K
%     [f, Sa, Sb, Sa0, Sab, y, CKO_procK(i)] = myfunc(N, i, T, kp);
% end    
% 
% i=1:K;
% plot(i, CKO_procK);

K=60;
CKO_procN=zeros(1,N);
for i=1:N
    [f, Sa, Sb, Sa0, Sab, y, CKO_procN(i)] = myfunc(i, K, T, kp);
end

i=1:N;
plot(i, CKO_procN);

%mygraph(N, K, Sa, Sab, f, y);

