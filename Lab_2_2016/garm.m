% ���������� ������� t � ��� �����
%� ������������������ ���� �� ���������  [-T,T], ��������,[-pi,pi]  
clear all;
close all;

clc;
N=1024;% %���������� �������� (��������� ������� y(t))
K=60; %���������� ������ ���� �����
T=pi; %�������� ��������� ������� f(i) ����� +/-T
kp=4.1; %���������� �������� ������������� �������

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

