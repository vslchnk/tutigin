%��������� ���������� ����������� ��������������� ��������
%��������������� �� 640�480 � ��������������� �� jpg � tif

clc;
for i=1:150
t=num2str(i)
path='D:\LifeCamFiles\P2\'
fname=strcat(path,t,'.jpg');
I=imread(fname);
% figure;imshow(I);
D=imresize(I, [640 480], 'bicubic'); %��� ������� �����������
imwrite(D,'H7.tif');
RGB=imread('H7.tif');
J=rgb2gray(RGB);
path='D:\LifeCamFiles\P1\';
fname=strcat(path,t,'.tif');
imwrite(J,fname);
end
%pause;
close all;
clear;