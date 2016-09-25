 %Программа производит зашумление изображения 
 %фильтрацию зашумленного изображения с помощью
 %различных фильтров, определение коэффициента корреляции
 %зашумленного и отфильтрованных изображений с исходным
   
   img=imread ('m00200001.tif'); 
   I=imcrop(img);  
   figure;   
   imshow (img);
   title('Исходное изображение');
   img1=imnoise(img,'gaussian',0,0.005);% 0.005
  % img1 = imnoise(img,'salt & pepper',0.01);
  % img1 = imnoise(img,'speckle',0.02); 
   figure;   
   imshow (img1);    
   title('Зашумленное изображение');   
         
  %Медианный фильтр 'medfilt2' 
  hsize=[3 3 ]; 
  F4= medfilt2(img1,hsize);
  figure; 
  imshow(F4);
  title('После медианного фильтра');
  pause;
    
  %Усредняющий фильтр 'Average' 
  hsize=[3 3 ]; 
  h= fspecial('average',hsize);
  F1=imfilter(img1,h,'replicate');
  figure; 
  imshow (F1);   
  title('После усредняющего фильтра');
  pause;
  
  ncorr = normxcorr2(I(:,:,1),img1(:,:,1)); 
  figure, surf(ncorr), shading flat;
  title('После зашумления');
  max_c_noised = max(abs(ncorr(:)))
  pause;
  
   ncorr = normxcorr2(I(:,:,1),F4(:,:,1)); 
   figure, surf(ncorr), shading flat;
   title('После медианного фильтра');
   max_c_median = max(abs(ncorr(:)))
   pause;
   
   ncorr = normxcorr2(I(:,:,1),F1(:,:,1)); 
   figure, surf(ncorr), shading flat;
   title('После усредняющего фильтра'); 
   max_c_average = max(abs(ncorr(:)))
   pause;   
  
  %Фильтр Гаусса 'gaussian' 
  hsize=[9 9];
  sigma=0.99;
  h= fspecial('gaussian',hsize,sigma);
  F2=imfilter(img1,h,'replicate');
  figure;
  imshow(F2);title('После фильтра Гаусса');
  pause;
  
   ncorr = normxcorr2(I(:,:,1),F2(:,:,1)); 
   figure, surf(ncorr), shading flat;
   title('После  фильтра Гаусса');
   max_c_gaussian = max(abs(ncorr(:)))
   pause;
   
  %Фильтр Лапласа 'laplacian'    
  alpha=0.5;
  h= fspecial('laplacian',alpha);
  F3=imfilter(img1,h,'replicate');
  figure;
  imshow(F3);title('После фильтра Лапласа');
  pause;
  
   ncorr = normxcorr2(I(:,:,1),F3(:,:,1)); 
   figure, surf(ncorr), shading flat;
   title('После  фильтра Лапласа');
   max_c_laplasian = max(abs(ncorr(:)))
   pause;
   
   %Фильтр повышения резкости 'unsharp'    
  alpha=0.2;
  h= fspecial('unsharp',alpha);
  F4=imfilter(img1,h);
  figure;
  imshow(F4);title('После фильтра unsharp');
  pause;
  
   ncorr = normxcorr2(I(:,:,1),F4(:,:,1)); 
   figure, surf(ncorr), shading flat;
   title('После  фильтра unsharp');
   max_c_unsharp = max(abs(ncorr(:)))
   pause;
   
 %Ранговый фильтр 
  m=5;n=5; 
  J=img1;
  imshow(J);
  J6 = ordfilt2(J, 7, ones(4,4));  
  figure;
  imshow(J6);title('После рангового фильтра');
  pause;
  
   ncorr = normxcorr2(I(:,:,1),J6(:,:,1)); 
   figure, surf(ncorr), shading flat;
   title('После  рангового фильтра');
   max_c_ordfilt2 = max(abs(ncorr(:)))
   pause; 
   
    %Фильтр Винера
  m=5;n=5;
  [J,noise] = wiener2(img1,[m n]);
  J6 = wiener2(J,[5 5]);  
  figure;
  imshow(J6);title('После фильтра Винера');
  pause;
  
   ncorr = normxcorr2(I(:,:,1),J6(:,:,1)); 
   figure, surf(ncorr), shading flat;
   title('После  фильтра Винера');
   max_c_wiener = max(abs(ncorr(:)))
   pause; 
   
   close all;
   clear;
