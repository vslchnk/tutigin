% ���������� ������� t � ��� �����
%� ������������������ ���� �� ���������  [-T,T], ��������,[-pi,pi]  
clear all;
close all;

clc;
% N=1024;% %���������� �������� (��������� ������� y(t))
% K=16; %���������� ������ ���� �����
% T=pi; %�������� ��������� ������� f(i) ����� +/-T
% kp=4.01; %���������� �������� ������������� �������
%����� ��� 4.5

% CKO_procK=zeros(1,K);
% % for i=1:K
%     [f, Sa, Sb, Sa0, Sab, y, CKO_procK(i)] = myfunc(N, K, T, kp);
% % end    
% 
% i=1:K;
% plot(i, CKO_procK);

% K=60;
% CKO_procN=zeros(1,N);
% for i=1:N
%     [f, Sa, Sb, Sa0, Sab, y, CKO_procN(i)] = myfunc(i, K, T, kp);
% end
% 
% i=1:N;
% plot(i, CKO_procN);


%���
%    
% K=60;
% CKO_procN=zeros(1,4);
% par = [128 256 512 1024];
% for i=1:4    
%     [f, Sa, Sb, Sa0, Sab, y, CKO_procN(i)] = myfunc(par(i), K, T, kp);
% end
% 
% plot(par, CKO_procN);

%���




T=pi;%�������� T (������������)
N=1024;%���������� �������� ������� �� ��������� [0,T]
M=60;%���������� ������ ���� �����
%p=1;%���������� ������� ������� x^p 
kp=4.4;%���������� �������� �������������� �������

% SKO_procM=zeros(1,M);
% for i=1:M
%     [f, C0, C, Cab, y, SKO_procM(i)] = myfunc_comp (N, i+6, T, kp);
% end
% i=1:M;
% plot(i, SKO_procM);

M = 32;
N = 4;
T  = 4;
SKO_procM=zeros(1,4);
par = [128 256 512 1024];
for i=1:4
    [f, C0, C, Cab, y, SKO_procM(i)] = myfunc_comp (par(i), M, T, kp);
end
i=1:4;
plot(par, SKO_procM);

%mygraph(N, K, Sa, Sab, f, y);

