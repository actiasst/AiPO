pkg load image
clc
clear all
close all

##[image] = imread("https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Pleiades_large.jpg/800px-Pleiades_large.jpg");
##
##mono = 0.2989*image(:,:,1) + 0.5870*image(:,:,2) + 0.1140 *image(:,:,3);
##
##skala = double(mono);
##skala = skala./255;
##imshow(skala);
##
##szum = zeros(576,800);
##
##licznik = 64;
##for i = 1:licznik
##szum += imnoise(skala,'gaussian',20/255,40/255);
##end
##szum = szum./licznik;
##szum=szum.*255;
##szum = uint8(szum);
##figure
##imshow(szum)
##
##roznica = szum - mono;
##
##for i = 1:1:256
##  wynik1(i) = 0;
##end
##
##for i = 1:1:576
##  for j = 1:1:800
##  wynik1(roznica(i,j,1)+1) += 1;
##  end
##end
##
##for i = 1:1:256
##  wynik1(i) /= 576*800;
##  end
##
##figure
##plot(wynik1)
##roznica = roznica.*(256/60);
##figure 
##imshow(roznica)
##
##for i = 1:1:256
##  wynik1(i) = 0;
##end
##
##for i = 1:1:576
##  for j = 1:1:800
##  wynik1(roznica(i,j,1)+1) += 1;
##  end
##end
##
##for i = 1:1:256
##  wynik1(i) /= 576*800;
##end
##
##figure
##plot(wynik1)
################################################################################

[image] = imread("C:\\Users\\Lord Actias\\Downloads\\piesek.jpg");
##imshow(image);

mono = mono = 0.2989*image(:,:,1) + 0.5870*image(:,:,2) + 0.1140 *image(:,:,3);
##imshow(mono);

mono = imnoise(mono,'salt & pepper');
imshow(mono);
wymiar1 = 700;
wymiar2 = 642;
tmp = zeros(9,1);
tmpimage = zeros(700,642);
licznik = 0;
for i = 2:wymiar1-1
  for j = 2:wymiar2-1
    tmp(1) = mono(i-1,j);
    tmp(2) = mono(i+1,j);
    tmp(3) = mono(i,j-1);
    tmp(4) = mono(i,j+1);
    tmp(5) = mono(i-1,j-1);
    tmp(6) = mono(i-1,j+1);
    tmp(7) = mono(i+1,j-1);
    tmp(8) = mono(i+1,j+1);
    tmp(9) = mono(i,j);
    a= median(tmp); 
    tmpimage(i,j) = a;
    licznik++;
  end
  licznik/(wymiar1*wymiar2)
end

figure
imshow(uint8(tmpimage))

################################################################################
##
##[image] = imread("C:\\Users\\Lord Actias\\Downloads\\electronic_G3.png");
####imshow(image);
##
##mono = mono = 0.2989*image(:,:,1) + 0.5870*image(:,:,2) + 0.1140 *image(:,:,3);
##imshow(mono);
##
##wymiar1 = 1300;
##wymiar2 = 1300;
##tmp = zeros(9,1);
##tmpimage = zeros(wymiar1,wymiar2);
##licznik = 0;
##for i = 2:wymiar1-1
##  for j = 2:wymiar2-1
##    tmp(1) = mono(i-1,j);
##    tmp(2) = mono(i+1,j);
##    tmp(3) = mono(i,j-1);
##    tmp(4) = mono(i,j+1);
##    tmp(5) = mono(i-1,j-1);
##    tmp(6) = mono(i-1,j+1);
##    tmp(7) = mono(i+1,j-1);
##    tmp(8) = mono(i+1,j+1);
##    tmp(9) = mono(i,j);
##    tmpimage(i,j) = -tmp(1) - tmp(2) - tmp(3) - tmp(4) - tmp(5) - tmp(6) - tmp(7) - tmp(8) +(9*tmp(9));
##    licznik++;
##  end
##  licznik/(wymiar1*wymiar2)
##end
##figure
##imshow(uint8(tmpimage))
##################################################################################
##[image] = imread("C:\\Users\\Lord Actias\\Downloads\\electronic_G3.png");
##mono = mono = 0.2989*image(:,:,1) + 0.5870*image(:,:,2) + 0.1140 *image(:,:,3);
##figure
##imshow(mono);
##
##wymiar1 = 1300;
##wymiar2 = 1300;
##tmp = zeros(5,1);
##tmpimage = zeros(wymiar1,wymiar2);
##licznik = 0;
##for i = 2:wymiar1-1
##  for j = 2:wymiar2-1
##    tmp(1) = mono(i-1,j);
##    tmp(2) = mono(i+1,j);
##    tmp(3) = mono(i,j-1);
##    tmp(4) = mono(i,j+1);
##    tmp(5) = mono(i,j);
##    tmpimage(i,j) = -tmp(1) - tmp(2) - tmp(3) - tmp(4) +(5*tmp(5));
##    licznik++;
##  end
##  licznik/(wymiar1*wymiar2)
##end
##
##figure
##imshow(uint8(tmpimage))
##################################################################################
##[image] = imread("C:\\Users\\Lord Actias\\Downloads\\electronic_G3.png");
##mono = mono = 0.2989*image(:,:,1) + 0.5870*image(:,:,2) + 0.1140 *image(:,:,3);
##figure
##imshow(mono);
##wymiar1 = 1300;
##wymiar2 = 1300;
##tmpimage = zeros(wymiar1,wymiar2);
##licznik = 0;
##for i = 2:wymiar1-1
##  for j = 2:wymiar2-1
##    tmpimage(i,j) = mono(i,j-1) + mono(i,j+1) - 2*mono(i,j);
##  licznik++;
##  end
##  licznik/(wymiar1*wymiar2)
##end
##
##for i = 2:wymiar1
##  for j = 2:wymiar2
##    if tmpimage(i,j) == 0;
##      tmpimage(i,j) = 255;
##    endif
##  end
##end
##
##
##figure
##imshow(uint8(tmpimage))





















