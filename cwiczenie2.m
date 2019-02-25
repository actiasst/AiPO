clc
clear all
close all

[image] = imread("http://home.agh.edu.pl/~asiwek/grafika/DSC08257_1.JPG");

##imshow(image)
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
##figure
##plot(wynik1)
##figure
##plot(wynik2)
##figure
##plot(wynik3)

####drugi podpunkt
##
mono = 0.2989*image(:,:,1) + 0.5870*image(:,:,2) + 0.1140 *image(:,:,3);
mono = mono(1:end-100,:);
imshow(mono)
figure
binary = (mono > 100 & mono < 140) *255;
imshow(!binary)

##map = [3/255,0,253/255;96/255,2/255,1/255];
##figure
##imshow(!binary,map)
####
####wynik = 0;
##
####trzeci podpunkt
##[w h] = size(binary);
##pole = sum(sum(binary))/255/(w*h);   
    
    
####czwarty podpunkt
[w h] = size(binary);
##sr_w = 0;
##sr_d = 0;
##ilosc = 0;
##for i = 1:1:w
##  for j = 1:1:h
##    if(binary(i,j) == 255)
##    sr_w+=i;
##    sr_d+=j;
##    ilosc += 1;
##    endif
##  end
##end
##
##hold on
##plot(sr_d/ilosc,sr_w/ilosc,'g+');

####piaty podpunkt
##
wynik_kontur = 0;
for i = 2:1:w - 1
  for j = 2:1:h - 1
    if(binary(i,j) == 0)
      tmp = 0;
      if binary(i,j+1) == 255
        tmp++;
        endif
      if binary(i,j-1) == 255
        tmp++;
        endif
      if binary(i-1,j) == 255
        tmp++;
        endif
      if binary(i+1,j) == 255
        tmp++;
      endif
      if(tmp <4 & tmp > 0)
      wynik_kontur++;
    endif
    endif
end
end
        


##zadenie 2

##image = imread("obrazek1.png");
##    
##imshow(image)
##
##for i = 1:1:256
##  wynik1(i) = 0;
##  wynik2(i) = 0;
##  wynik3(i) = 0;
##end
##
##[h w cos] = size(image)
##licznik = 0;
##for i = 1:1:4135
##  for j = 1:1:7459
##  wynik1(image(i,j,1)+1) += 1;
##  wynik2(image(i,j,2)+1) += 1;
##  wynik3(image(i,j,3)+1) += 1;
##  licznik++;
##end
##  licznik/(w*h)
##end
##
##for i = 1:1:256
##  wynik1(i) /= w*h;
##  wynik2(i) /= w*h;
##  wynik3(i) /= w*h;
##  end
##
##figure
##plot(wynik1)
##figure
##plot(wynik2)
##figure
##plot(wynik3)

################################################################################
##[h w cos] = size(image);
##for i = 1:1:256
##  wynik1(i) = 0;
##end
##licznik = 0;
##tmp = 256/50;
##image(:,:,1) = image(:,:,1)*tmp;
##image(:,:,2) = image(:,:,2)*tmp;
##image(:,:,3) = image(:,:,3)*tmp;
##luminancja = 0.2989*image(:,:,1) + 0.5870*image(:,:,2) + 0.1140 *image(:,:,3);
##for i = 1:1:4135
##  for j = 1:1:7459
##  wynik1(image(i,j,1)+1) += 1;
##  licznik++;
##end
##licznik/(w*h)
##end
##
##for i = 1:1:256
##  wynik1(i) /= w*h;
##end
##
##plot(wynik1)
##figure
##imshow(image)
################################################################################

##imshow(image)
##tmp = 256/50;
##image(:,1:4090,1) = image(:,1:4090,1)*tmp;
##image(:,1:4090,2) = image(:,1:4090,2)*tmp;
##image(:,1:4090,3) = image(:,1:4090,3)*tmp;
##
##image(1:1331,4090:7459,1) = image(1:1331,4090:7459,1)*tmp;
##image(1:1331,4090:7459,2) = image(1:1331,4090:7459,2)*tmp;
##image(1:1331,4090:7459,3) = image(1:1331,4090:7459,3)*tmp;
##
##image(1332:2987,4859:7459,1) = image(1332:2987,4859:7459,1)*tmp;
##image(1332:2987,4859:7459,2) = image(1332:2987,4859:7459,2)*tmp;
##image(1332:2987,4859:7459,3) = image(1332:2987,4859:7459,3)*tmp;
##
##image(2988:4135,4090:7459,1) = image(2988:4135,4090:7459,1)*tmp;
##image(2988:4135,4090:7459,2) = image(2988:4135,4090:7459,2)*tmp;
##image(2988:4135,4090:7459,3) = image(2988:4135,4090:7459,3)*tmp;
##
##a = floor((4859 - 4090)/2);
##b = floor((2988 - 1331)/2); 
##srodekX = 4090 + a;
##srodekY = 1331 + b;
##
## for i = 1331:2988
##  for j = 4090:4859
##    if ( ((j - srodekX)^2)/a^2 <= 1 - ((i - srodekY)^2)/b^2 )
##      continue
##      endif
##  image(i,j,1) *= tmp;
##  image(i,j,2) *= tmp;
##  image(i,j,3) *= tmp;
##end
##end
##
##
##
##figure
##imshow(image)
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
