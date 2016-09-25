%ѕрограмма создани€ эталонных изображений
%из фотоизображений  480х640 формата .tif

clc;
for i=1:10
t=num2str(i);%номер исходного фотоизображени€
password=num2str(i);%номер группы эталонов
path='D:\LifeCamFiles\P1\';
fname=strcat(path,t,'.tif');
J=imread (fname);%„тение файла с изображением дл€ создани€
%группы эталонов
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

set(0,'ShowHiddenHandles','on')%автоматическое удаление всех figures
close all;
clear;
end