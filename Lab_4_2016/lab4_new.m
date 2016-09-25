%��������������� ������������� �������� �������� ���
%��� ��������� �������� ����������� �������
%"���������" ������� ������������ ����������
%���, ���������������, ������-�������������,�����������������
%� �������� ���������� ��������� ��������� � ��������� �������� 
%������������� ����������� ������������� ������������ ����������,
%������������ ����������, ����� ������� �������� (����� �����������),
%����� ������� ����� (����� �����������)
 
clc;%������� Command Window
kt=1024; % ���������� ��������
A=1;% ��������� �������
Q=0.1;%��� ����
kp=4.73;%���������� �������� �������
 
%1. ��������� ���������� �������
for i=1:kt %��������� ������� �������
    y(i)=0;
end 
noise=randn(kt);
%noise=wgn(kt,1,0);
for i=1:kt %��������� ���������� ������� � ���������������� ����������
     w(i)=exp(-20*((i-kt/2)/kt)^2);% ��������������� ������� �������
     y(i)=A*cos(2*pi*kp*(i-kt/2)/kt)*w(i);
     y(i)=y(i)+Q*noise(i);                                               
end
i=1:kt; %����������� ���������� ������� �� ��������� �������
figure
plot(i,y);
axis tight;
title('Original signal')
xlabel('Sample number')
%2. �������������� �������������� (���)
bpfy=fft(y,kt);%���
bpf=bpfy.*conj(bpfy)/kt;%���
%���������� ����. ����. ������� ��� ��� ������� Y
C=max(bpf);
for i=1:kt %����� ���������� ��������, ��������������� ��������� ���
    if (bpf(i)==C)          
        kpbpf=(i-1);         
        break
    end
end
kp_bpf=kpbpf
 
%3. �������� �������� � ���������������
kp1=kpbpf;
seach_area=0.8/kp1;%������� ������  �������. kp_bpf   
for ki=1:3 %���������� ��������    
shagkor=kp1*seach_area/3;%��� ������
        k=0;
  for j=kp1-kp1*seach_area:shagkor:kp1+kp1*seach_area %���� ��� �������� 6 �������� � ����������� ������������� 
            %�������� ���������� ��������, ������������ � ������� ���.           
            k=k+1;
            xkor(k)=j;
            kor(k)=0;
            for i=1:kt           
                x(i)=0;    
            end
%���������� �������� ��������� ��������              
        for i=1:kt                                                
            x(i)=A*cos(2*pi*j*(i-kt/2)/kt)*w(i);
        end    
%���������� ������� �������� ���������� � ��������� ��������
            x_sr=mean(x);
            y_sr=mean(y);
            x_sko=0;
            y_sko=0; 
            kor1(k)=0;%%��������� �������� ���������� ���������
%����������  ���������� ��������� ���������� � ��������� ��������
        for i=1:kt
           x_sko=x_sko+(x(i)-x_sr)*(x(i)-x_sr);
           y_sko=y_sko+(y(i)-y_sr)*(y(i)-y_sr);
           kor(k)=kor(k)+(x(i)-x_sr)*(y(i)-y_sr);%���������� ����. ����������
            sxy(i)=abs(x(i)-y(i));%���������� ������ ��������
            kor1(k)=kor1(k)+sxy(i); %���������� ����� ������� ��������
            %(����� �����������)                                 
            sxy(i)=abs(x(i)+y(i));%���������� ������ ����� 
            kor1(k)=kor1(k)+sxy(i); %���������� ����� ������� �����  
            %(����� �����������)                                 
        end  
            kor1(k)=kor(k)/(sqrt(x_sko*y_sko));%���������� ����. ����������            
  end %����� ����� �������� �������� � ���������� ������� ����. ����.
  
  %������-������������� � �����������������
        xx=1:k;
        xi=1:0.1:k;
        r1=cos(xx); %������ ��� ������������ ������-�������������       
        yint=interp1(xx,kor1,xi,'spline');% ������-������������� ���� ����������               
        r1=kor1;       
        apr=spaps(xkor,kor1,0.00000001);
        figure
        fnplt(apr)
        hold on
        plot(xkor,r1,'ro');
        hold off  
        
%���������� ����������� �������� ���������� �������� �������
        cmax=max(yint); %���������� ��������� ����. ����.       
        for i=1:round((k-1)/0.1+1)
            if (yint(i)==cmax)     
                kp_int=kp1-kp1*seach_area+(i-1)*shagkor/10 %���������� �������� ������� �� ��� ������� ����. ����.
            end           
        end
        seach_area=seach_area/2;
        kp1=kp_int;
end  
 
pause;
close all;%�������� ���� ���� ������������ ������
clear;%������� Workspace
