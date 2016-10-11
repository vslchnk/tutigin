% ���������� ������� t � ��� �����
%� ������������������ ���� �� ���������  [-T,T], ��������,[-pi,pi]  
clear all;
close all;

clc;
N=1024;% %���������� �������� (��������� ������� y(t))
K=200; %���������� ������ ���� �����
T=pi; %�������� ��������� ������� f(i) ����� +/-T
kp=4.2; %���������� �������� ������������� �������

CKO_procK=zeros(1,K);
for i=1:K
    [f, Sa, Sb, Sa0, Sab, y, CKO_procK(i)] = myfunc(N, i, T, kp);
end    

i=1:K;
plot(i, CKO_procK);

% Nu = [128 256 512 1024];
% CKO_procN=zeros(1,4);
% for i=1:4
%     [f, Sa, Sb, Sa0, Sab, y, CKO_procN(i)] = myfunc(Nu(i), K, T, kp);
% end

% i=1:4;
% plot(Nu, CKO_procN)

% K=60;
% CKO_procN=zeros(1,N);
% for i=1:N
%     [f, Sa, Sb, Sa0, Sab, y, CKO_procN(i)] = myfunc(i, K, T, kp);
% end
% 
% i=1:N;
% plot(i, CKO_procN);

T=4;%�������� T (������������)
N=1024;%���������� �������� ������� �� ��������� [0,T]
M=32;%���������� ������ ���� �����
%p=1;%���������� ������� ������� x^p 
kp=4.5;%���������� �������� �������������� �������

% SKO_procM=zeros(1,M);
% for i=1:M
%     [f, C0, C, Cab, y, SKO_procM(i)] = myfunc_comp (N, i, T, kp);
% end
% i=1:M;
% plot(i, SKO_procM);

% Nu = [128 256 512 1024];
% SKO_procN=zeros(1,4);
% for i=1:4
%     [f, C0, C, Cab, y, SKO_procN(i)] = myfunc_comp (Nu(i), M, T, kp);
% end
% plot(Nu, SKO_procN)

%mygraph(N, K, Sa, Sab, f, y);