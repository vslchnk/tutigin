% ���������� ������� t � ��� �����
%� ������������������ ���� �� ���������  [-T,T], ��������,[-pi,pi]  
clear all;
clc;
N=512; %���������� �������� (��������� ������� y(t))
K=16; %���������� ������ ���� �����
T=pi; %�������� ��������� ������� f(i) ����� +/-T
kp=4.1; %���������� �������� ������������� �������
y=zeros(1,N+1);
Sa = zeros(1,K);
Sb = zeros(1,K);
p=2;% ���������� ������� ������� t^p
f=zeros(1,N+1);
Sa0=0;

counter = 1;
for i=1:N+1
    
    % ������� �� ����� ��������� N
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

%������?
%N = counter - 2;

Sa0=Sa0/N; %����������� ����. a0/2
%Saa0=pi^2/3 %%������������ ������������ ����. �0/2 ��� ������� t^2
for i=1:N+1
    for j=1:K
        Sa(j) = (Sa(j)+f(i)*cos((j)*2*pi*(i-1-N/2)/N));
        Sb(j) = (Sb(j)+f(i)*sin((j)*2*pi*(i-1-N/2)/N));        
    end
   
end
for j=1:K
    Sa(j)=Sa(j)*(1/(N/2));
    Sb(j)=Sb(j)*(1/(N/2));
   % Saa(j)= 4*(-1)^j/(j^2);%������������ ������������ ����. �k ��� ������� t^2
end
SSa=Sa; %������������ ak
SSb=Sb; %������������ bk4fi_res=atan(SSa(kp)/SSb(kp))
%SSaa=Saa %������������ ������������ ����. �k ��� ������� t^2 
i=1:K;
figure 
plot(i,Sa);
title('������������ Sa');
%���������� � ����������� ������� �������� (������)
for j=1:K 
Sab(j)=sqrt(Sa(j)^2+Sb(j)^2);
end
i=1:K;
figure 
%plot(i,Sab);
stem(Sab(1:K)); %����� �������  ���������� ������������������ ������
axis([1 8 -0.2 1.2]);%������� ����: [xmin xmax ymin ymax]
title('��������� ��������� ������������ �������');
xlabel('���������� ��������')
axis tight;
%���������� � ����������� ������� �������� (�����)
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
  dy(i)=y(i)-f(i);%���������� ����������� ��������������
end
dy_proc=dy/max(f)*100;
CKO=std(dy);
CKO_proc=std(dy_proc)%��� � ���������





pause;
close all;
clear;
