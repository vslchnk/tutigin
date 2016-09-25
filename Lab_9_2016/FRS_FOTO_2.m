%��������� �������� ��������� �����������
%�� ���������������  480�640 ������� .tif

clc;
for i=1:10
t=num2str(i);%����� ��������� ���������������
password=num2str(i);%����� ������ ��������
path='D:\LifeCamFiles\P1\';
fname=strcat(path,t,'.tif');
J=imread (fname);%������ ����� � ������������ ��� ��������
%������ ��������
J3=imresize(J,0.5,'bicubic');
figure; imshow(J3);
I=imcrop(J3);
figure; imshow(I);

path='D:\LifeCamFiles\';
h = waitbar(0,'Please wait...');
for i=1:16        
       t=num2str(10+i);   
       k=0.84+i*0.02;
       J=imresize(I,k,'bicubic');
       fname=strcat(path,password,t,'.tif');        
       imwrite(J,fname);                   
%      figure;imshow(J); 
       waitbar(i/16)
end
pause(2);

set(0,'ShowHiddenHandles','on')%�������������� �������� ���� figures
close all;
clear;
end