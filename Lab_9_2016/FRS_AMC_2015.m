%��������� ��������������� ��������� ���������������
% ��������� ��������������� � ����������
clear;
msgbox('�������  ������ ','�������� �������','warn');
answer=input('������� ������  ','s');
password=char(answer);
set(0,'ShowHiddenHandles','on');%�������������� �������� ���� figures
delete(get(0,'Children'));%�������������� �������� ���� figures
ibad=1;
msgbox('�������  ��� ��������������� ��� ��������� ','�������� ���������','warn');
answer=input('������� ��� ���������������  ','s');
t=char(answer)

%path='C:\Documents and Settings\TVS\��� ���������\P2\';
path='D:\!!!!!!DSP_LAB_2014A\LAB_9_DSP\LifeCamFiles\P2\';
fname=strcat(path,t,'.jpg')
I=imread(fname);
D=imresize(I, [640 480], 'bicubic'); %��� ������� �����������
imshow(D);
%��������� �������� ��������������� ����������� �� ����������� ������
%100 - ���������� ��������� ��������, 0,05 - ���, 
% ����. ���������� � �������. ������������ 0,95 - 3*���
k=abs(1.0+ 0.05*(randn(size(100))))

I=imresize(D,k,'bicubic');%��������� �������� %%%%%%%%%%%%%
%��������� 3 ������ - ��� ������������ ���������� ��������������� ����
%��� ����� ������� ��������� �������
% path='C:\Documents and Settings\TVS\��� ���������\P1\'; 
% fname=strcat(path,password,'.jpg');
% imwrite(I,fname);

set(0,'ShowHiddenHandles','on');%�������������� �������� ���� figures
delete(get(0,'Children'));%�������������� �������� ���� figures  

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
%path='C:\Documents and Settings\TVS\��� ���������\LifeCam Files\'; 
path='D:\!!!!!!DSP_LAB_2014A\LAB_9_DSP\LifeCamFiles\';
h = waitbar(0,'Please wait...');
for i=1:8        
        t=num2str(78+i);        
        fname=strcat(path,password,t,'.tif'); 
        X2=imread(fname);     
        figure;imshow(X2);
        % ������� ������� ���������: X2 � X1
        ncorr = normxcorr2(X2(:,:,1),X1(:,:,1)); 
       % figure, surf(ncorr), shading flat;
        max_c = max(abs(ncorr(:)));       
        y(i)=max_c;
        waitbar(i/8)
end
i=1:8;
   mmm=y(i)  
set(0,'ShowHiddenHandles','on')%�������������� �������� ���� figures
delete(get(0,'Children'))%�������������� �������� ���� figures
y(9)=0;
corr=y;
max_corr=max(y)
if max_corr>0.88
    msgbox('������ ��������','Resolution','warn');
    pause(2);
    set(0,'ShowHiddenHandles','on')%�������������� �������� ���� figures
    delete(get(0,'Children'))%�������������� �������� ���� figures  
else
    msgbox('������ ��������!!!','Resolution','error');
   % t=num2str(78+ibad);   
    %t=num2str(78);       
    %path='C:\Documents and Settings\TVS\��� ���������\P3\'; 
   % fname=strcat(path,password,t,'.jpg');     
%     XX=imread('C:\Documents and Settings\TVS\��� ���������\P2\5.bmp');
%     %figure;imshow(XX);
%     imwrite(XX,fname);
    
end   
pause(2);
set(0,'ShowHiddenHandles','on')%�������������� �������� ���� figures
%delete(get(0,'Children'))%�������������� �������� ���� figures

%%%%%%%%%%%%%%%%%%%%%%%���������� ����%%%%%%%%%%%%%%%%%%%%%%%   
if max_corr < 0.92  
%I=imread ('C:\Documents and Settings\TVS\��� ���������\P2\a.jpg');%��������� ������� ��������� ����
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
%%%%%%%%%%%%%%����� ��������� ���������� ����%%%%%%%%%%%%%%%%%%%%%%       
end 
pause;  
clear;
%end  
%end
%delete ('C:\Documents and Settings\TVS\��� ���������\P2\*.bmp')  