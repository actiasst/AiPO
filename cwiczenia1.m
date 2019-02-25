clc
clear all
close all

pkg load image

##[image map] = imread("http://home.agh.edu.pl/~asiwek/images/RGB_map.png");
##%pierwszy podpunkt
##binary = im2bw(image,map,0.5);
##figure
##imshow(binary)
##
##%drugi podpunkt
##graymap = [0,0,0;0.5,0.5,0.5];
##figure
##imshow(image,graymap)
##
##%trzeci podpunkt
##kolormap = colormap(rainbow);
##figure
##imshow(image,kolormap)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%zadanie 2
%pierwszy podpunkt

##[image] = imread("http://home.agh.edu.pl/~asiwek/images/Hist_tools.jpg");
##
##for i = 1:1:256
##  wynik1(i) = 0;
##  wynik2(i) = 0;
##  wynik3(i) = 0;
##end
##
##for i = 1:1:584
##  for j = 1:1:872
##  wynik1(image(i,j,1)+1) += 1;
##  wynik2(image(i,j,2)+1) += 1;
##  wynik3(image(i,j,3)+1) += 1;
##  end
##end
##
##for i = 1:1:256
##  wynik1(i) /= 586*872;
##  wynik2(i) /= 586*872;
##  wynik3(i) /= 586*872;
##  end
##
##
##semilogy(wynik1)
##figure
##semilogy(wynik2)
##figure
##semilogy(wynik3)
##
##drugi podpunkt
##
##image = rgb2gray(image);
##imshow(image)
##
##for i = 1:1:255
##  wynik1(i) = 0;
##end
##
##for i = 1:1:584
##  for j = 1:1:872
##  wynik1(image(i,j)+1) += 1;
##  end
##end
##
##for i = 1:1:255
##  wynik1(i) /= 586*872;
##  end
##
##figure
##semilogy(wynik1)
##
##trzeci podpunkt
##imshow(image)
##figure
##image2 = im2bw(image,0.3);
##imshow(image2)
##figure
##image2 = im2bw(image,0.5);
##imshow(image2)
##figure
##image2 = im2bw(image,0.6);
##imshow(image2)
##figure
##image2 = im2bw(image,0.9);
##imshow(image2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%zadanie trzecie
%pierwszy podpunkt

[image] = imread("http://home.agh.edu.pl/~asiwek/images/Contrast_Xray.jpg");
imshow(image)
tmp = 255/83
for i = 1:1:390
  for j = 1:1:320
    image(i,j)-=85;
    image(i,j)*=tmp;
  end
end
figure
imshow(image)
figure

for i = 1:1:255
  wynik1(i) = 0;
end

for i = 1:1:390
  for j = 1:1:320
  wynik1(image(i,j)+1) += 1;
  end
end

for i = 1:1:255
  wynik1(i) /= 390*320;
end

plot(wynik1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%zadanie czwarte
%pierwszy podpunkt

##[image] = imread("http://home.agh.edu.pl/~asiwek/images/Contrast_gamma.png");
##imshow(image)
##image = rgb2gray(image);
##figure
##imshow(image)
##
##for i = 1:1:255
##  wynik1(i) = 0;
##end
##
##for i = 1:1:1080
##  for j = 1:1:1920
##  wynik1(image(i,j)+1) += 1;
##  end
##end
##
##for i = 1:1:255
##  wynik1(i) /= 1080*1920;
##end
##figure
##plot(wynik1)
##
##for i = 1:1:1080
##  for j = 1:1:1920
##    image(i,j) = image(i,j)^1.2;
##  end
##end
##
##
##figure
##imshow(image)
##
##for i = 1:1:255
##  wynik1(i) = 0;
##end
##
##for i = 1:1:1080
##  for j = 1:1:1920
##  wynik1(image(i,j)+1) += 1;
##  end
##end
##
##for i = 1:1:255
##  wynik1(i) /= 1080*1920;
##end
##figure
##plot(wynik1)
##
##for i = 1:1:1080
##  for j = 1:1:1920
##    image(i,j) = image(i,j)^1.5;
##  end
##end
##
##
##figure
##imshow(image)
##
##for i = 1:1:255
##  wynik1(i) = 0;
##end
##
##for i = 1:1:1080
##  for j = 1:1:1920
##  wynik1(image(i,j)+1) += 1;
##  end
##end
##
##for i = 1:1:255
##  wynik1(i) /= 1080*1920;
##end
##figure
##plot(wynik1)


















