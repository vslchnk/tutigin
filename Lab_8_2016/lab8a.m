%�������������� ��������� ���� �����������
%���� ������ �����

   img=imread ('m00200001.tif'); 
   I=imcrop(img);  
   figure;   
   imshow (img);
   title('������ �����������');
   J=imread ('m00200031.tif');     
   figure;   
   imshow (J);
   title('������ �����������');
   
   ncorr = normxcorr2(I(:,:,1),J(:,:,1)); 
   figure, surf(ncorr), shading flat;
   title('��������� ����������� ������ �����');
   max_c = max(abs(ncorr(:)))
   pause; 
   
   close all;
   clear;