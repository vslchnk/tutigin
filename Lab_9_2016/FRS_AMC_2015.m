%Программа корреляционного сравнения полноформатного
% архивного фотоизображения с эталонными
clear;
msgbox('Введите  пароль ','Контроль допуска','warn');
answer=input('Введите пароль  ','s');
password=char(answer);
set(0,'ShowHiddenHandles','on');%автоматическое удаление всех figures
delete(get(0,'Children'));%автоматическое удаление всех figures
ibad=1;
msgbox('Введите  код фотоизображения для сравнения ','Контроль сравнения','warn');
answer=input('Введите код фотоизображения  ','s');
t=char(answer)

%path='C:\Documents and Settings\TVS\Мои документы\P2\';
path='D:\!!!!!!DSP_LAB_2014A\LAB_9_DSP\LifeCamFiles\P2\';
fname=strcat(path,t,'.jpg')
I=imread(fname);
D=imresize(I, [640 480], 'bicubic'); %для больших изображений
imshow(D);
%Изменение масштаба полноформатного изображения по нормальному закону
%100 - количество случайных значений, 0,05 - СКО, 
% макс. отклонение с доверит. вероятностью 0,95 - 3*СКО
k=abs(1.0+ 0.05*(randn(size(100))))

I=imresize(D,k,'bicubic');%изменение масштаба %%%%%%%%%%%%%
%следующие 3 строки - для контрольного сохранения фотоизображений всех
%кто делал попытки получения допуска
% path='C:\Documents and Settings\TVS\Мои документы\P1\'; 
% fname=strcat(path,password,'.jpg');
% imwrite(I,fname);

set(0,'ShowHiddenHandles','on');%автоматическое удаление всех figures
delete(get(0,'Children'));%автоматическое удаление всех figures  

figure; imshow(I);
imwrite(I,'H7.tif');
RGB=imread('H7.tif');
J=rgb2gray(RGB);
J2=imcrop(J,[140 0 400 480]);
%J2=imcrop(J);
X1=imresize(J2,0.78,'bicubic');
% figure; imshow(X1);
% t=num2str(78+4);  %%%%%%%%%%   
% path='D:\!!!!!!DSP_LAB_2014A\LAB_9_DSP\LifeCamFiles\';
% fname=strcat(path,password,t,'.tif');%%%%%%%%%% 
% X2=imread(fname); %%%%%%%%%%%%% 
%  figure;imshow(X2);
% pause;
%path='C:\Documents and Settings\TVS\Мои документы\LifeCam Files\'; 
path='D:\!!!!!!DSP_LAB_2014A\LAB_9_DSP\LifeCamFiles\';
h = waitbar(0,'Please wait...');
for i=1:8        
        t=num2str(78+i);        
        fname=strcat(path,password,t,'.tif'); 
        X2=imread(fname);     
        figure;imshow(X2);
        % изменен порядок сравнения: X2 с X1
        ncorr = normxcorr2(X2(:,:,1),X1(:,:,1)); 
       % figure, surf(ncorr), shading flat;
        max_c = max(abs(ncorr(:)));       
        y(i)=max_c;
        waitbar(i/8)
end
i=1:8;
   mmm=y(i)  
set(0,'ShowHiddenHandles','on')%автоматическое удаление всех figures
delete(get(0,'Children'))%автоматическое удаление всех figures
y(9)=0;
corr=y;
max_corr=max(y)
if max_corr>0.88
    msgbox('Допуск разрешен','Resolution','warn');
    pause(2);
    set(0,'ShowHiddenHandles','on')%автоматическое удаление всех figures
    delete(get(0,'Children'))%автоматическое удаление всех figures  
else
    msgbox('Допуск запрещен!!!','Resolution','error');
   % t=num2str(78+ibad);   
    %t=num2str(78);       
    %path='C:\Documents and Settings\TVS\Мои документы\P3\'; 
   % fname=strcat(path,password,t,'.jpg');     
%     XX=imread('C:\Documents and Settings\TVS\Мои документы\P2\5.bmp');
%     %figure;imshow(XX);
%     imwrite(XX,fname);
    
end   
pause(2);
set(0,'ShowHiddenHandles','on')%автоматическое удаление всех figures
%delete(get(0,'Children'))%автоматическое удаление всех figures

%%%%%%%%%%%%%%%%%%%%%%%Обновление базы%%%%%%%%%%%%%%%%%%%%%%%   
if max_corr < 0.92  
%I=imread ('C:\Documents and Settings\TVS\Мои документы\P2\a.jpg');%Прочитали базовый эталонный файл
%figure; imshow(I);%%%%%%%%%
%imwrite(I,'H7.tif');
%RGB=imread('H7.tif');
%J=rgb2gray(RGB);
%J2=imcrop(J,[140 0 400 480]);
%figure; imshow(J2);
%imwrite(J2,'H7gray.tif');
%J3=imresize(J2,0.5,'bicubic');
%figure; imshow(J3);%%%%%%%
%I=imcrop(J3);
%figure; imshow(I);
%h = waitbar(0,'Please wait...');
%for i=1:8         
%        t=num2str(78+i);   
%        k=0.88+i*0.02;
%        J=imresize(I,k,'bicubic');
%        fname=strcat(path,password,t,'.tif'); 
%        fname=strcat(password,t,'.tif'); 
%        imwrite(J,fname);            %        
%        figure;imshow(J); 
%        waitbar(i/8)
%end
%%%%%%%%%%%%%%Конец фрагмента обновления базы%%%%%%%%%%%%%%%%%%%%%%       
end 
pause;  
clear;
%end  
%end
%delete ('C:\Documents and Settings\TVS\Мои документы\P2\*.bmp')  