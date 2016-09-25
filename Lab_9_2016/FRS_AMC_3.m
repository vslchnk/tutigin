%��������� ��������������� ��������� ���������������
% ��������������� � ����������
clc;
msgbox('�������  ����� ��������������� ���������������','����� ������ �����������','warn');
answer=input('������� ����� ���������������  ','s');
t=char(answer);
path='D:\LifeCamFiles\P1\';
fname=strcat(path,t,'.tif');
I=imread(fname);

msgbox('�������  ����� ������ �������� ','����� ������ ��������','warn');
answer=input('������� ����� ������ ��������  ','s');
password=char(answer);

%��������� �������� ��������������� ����������� �� ����������� ������
%100 - ���������� ��������� ��������, 0,05 - ���, 
% ����. ���������� � �������. ������������ 0,95 - 3*���
k=abs(1.0+ 0.05*(randn(size(100))));
J=imresize(I,k,'bicubic');%��������� �������� 
X1=imresize(I,0.78,'bicubic');
figure;imshow(X1);

path='D:\LifeCamFiles\';
h = waitbar(0,'Please wait...');
for i=1:8        
        t=num2str(78+i);        
        fname=strcat(path,password,t,'.tif'); 
        X2=imread(fname);     
       % figure;imshow(X2);
        % ������� ������� ���������: X2 � X1
        ncorr = normxcorr2(X2(:,:,1),X1(:,:,1)); 
       % figure, surf(ncorr), shading flat;
        max_c = max(abs(ncorr(:)));       
        y(i)=max_c;
        waitbar(i/8)
end

set(0,'ShowHiddenHandles','on')%�������������� �������� ���� figures
delete(get(0,'Children'))%�������������� �������� ���� figures
y(9)=0;
corr=y;
max_corr=max(y)
set(0,'ShowHiddenHandles','on')%�������������� �������� ���� figures

close all;
clear;
 