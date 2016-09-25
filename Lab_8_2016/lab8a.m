%Корреляционное сравнение двух изображений
%двух разных людей

   img=imread ('m00200001.tif'); 
   I=imcrop(img);  
   figure;   
   imshow (img);
   title('Первое изображение');
   J=imread ('m00200031.tif');     
   figure;   
   imshow (J);
   title('Второе изображение');
   
   ncorr = normxcorr2(I(:,:,1),J(:,:,1)); 
   figure, surf(ncorr), shading flat;
   title('Сравнение изображений разных людей');
   max_c = max(abs(ncorr(:)))
   pause; 
   
   close all;
   clear;