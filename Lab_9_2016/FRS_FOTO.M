%Файлы заносятся в каталог  LifeCam Files,
%стартовое имя файла из серии складывается из пароля и порядкового номера
%файла в серии
%Внимание! Программа должна находиться в каталоге LifeCamFiles
prompt = {'Password:'};
dlg_title = 'Enter password';
num_lines= [1 20];
answer  = inputdlg(prompt,dlg_title,num_lines);
password=char(answer);
[fname,pname]=uigetfile('D:\LifeCamFiles\*.jpg');
path='D:\LifeCamFiles\';
fname1=strcat(path,fname); 
I=imread(fname1);%Прочитали базовый эталонный файл 
figure; imshow(I);
pause(3);
imwrite(I,'H7.tif');
RGB=imread('H7.tif');
J=rgb2gray(RGB);
J2=imcrop(J,[140 0 400 480]);
figure; imshow(J2);
%imwrite(J2,'H7gray.tif');
J3=imresize(J2,0.5,'bicubic');
figure; imshow(J3);
I=imcrop(J3);
figure; imshow(I);
for i=1:8        
        t=num2str(78+i);   
        k=0.88+i*0.02;
        J=imresize(I,k,'bicubic');
        path='D:\LifeCamFiles\';
        fname=strcat(path,password,t,'.tif'); 
       % fname=strcat(password,t,'.tif'); 
        imwrite(J,fname);            
        %figure;imshow(X2); 
        figure;imshow(J); 
        waitbar(i/8)
end
set(0,'ShowHiddenHandles','on')%автоматическое удаление всех figures
delete(get(0,'Children'))%автоматическое удаление всех figures