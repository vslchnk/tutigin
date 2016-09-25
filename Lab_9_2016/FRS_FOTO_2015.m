%Программа создания эталонных изображений
%из фотоизображений  480х640 формата .jpg
msgbox('Введите  пароль ','Контроль допуска','warn');
answer=input('Введите пароль  ','s');
password=char(answer);
msgbox('Введите  код фотоизображения для эталонов ','Эталоны','warn');
answer=input('Введите код полноформатного фотоизображения  ','s');
t=char(answer)
path='D:\LifeCamFiles\P2\';
fname=strcat(path,t,'.jpg');

I=imread ('D:\LifeCamFiles\P2\a.jpg');%Прочитали базовый эталонный файл
figure; imshow(I);%%%%%%%%%
%pause;
imwrite(I,'H7.tif');
RGB=imread('H7.tif');
J=rgb2gray(RGB);

J3=imresize(J,0.5,'bicubic');
figure; imshow(J3);%%%%%%%
I=imcrop(J3);
figure; imshow(I);

path='D:\LifeCamFiles\';
h = waitbar(0,'Please wait...');
for i=1:16        
       t=num2str(78+i);   
       k=0.84+i*0.02;
       J=imresize(I,k,'bicubic');
       fname=strcat(path,password,t,'.tif');        
       imwrite(J,fname);                   
       figure;imshow(J); 
       waitbar(i/8)
end
pause(2);
set(0,'ShowHiddenHandles','on')%автоматическое удаление всех figures
delete(get(0,'Children'))%автоматическое удаление всех figures