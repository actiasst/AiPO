pkg load image
clc
clear all
close all

##[image] = imread("http://home.agh.edu.pl/~asiwek/images/sunburst-made-of-lines-720x720.jpg");
##
##imshow(image);
##image = double(image);
##N = 720;
##
##tmp = zeros(N,N);
##
##for i = 1:N
##  for j = 1:N
##    tmp(i,j) = image(i,j)*(-1)^(i+j);
##  end
##end
##
##figure
##imshow(tmp)
##
##fftwynik = fft2(tmp);
##widmoMocy = real(fftwynik).^2 + imag(fftwynik).^2;
##maxx = max(max(widmoMocy));
##minn = min(min(widmoMocy));
##widmoMocy = widmoMocy .-minn;
##widmoMocy = widmoMocy .*(255/maxx);
##figure
##imshow(widmoMocy)
##
##wynikifft = ifft2(fftwynik);
##figure
##imshow(wynikifft)
##
##tmp2 = zeros(N,N);
##for i = 1:N
##  for j = 1:N
##    tmp2(i,j) = (real(wynikifft(i,j)))*(-1)^(i+j);
##  end
##end
##tmp2 = uint8(tmp2*255);
##figure
##imshow(tmp2)

################################################################################
##[image] = imread("http://home.agh.edu.pl/~asiwek/images/lwblog-line23.jpg");
##
##
##mono = 0.2989*image(:,:,1) + 0.5870*image(:,:,2) + 0.1140 *image(:,:,3);
##image = mono;
##image = double(image);
##imshow(uint8(image));
##N = 885;
##M = 1125;
##tmp = zeros(N,M);
##
##for i = 1:N
##  for j = 1:M
##    tmp(i,j) = image(i,j)*(-1)^(i+j);
##  end
##end
##
##fftwynik = fft2(tmp);
##widmoMocy = real(fftwynik).^2 + imag(fftwynik).^2;
##maxx = max(max(widmoMocy));
##minn = min(min(widmoMocy));
##widmoMocy = widmoMocy .-minn;
##widmoMocy = widmoMocy .*(255/maxx);
##figure
##imshow(widmoMocy)
##
####for i = 1:N
####  for j = 1:M
####    if sqrt((N/2 - i)^2 + (M/2 - j)^2) > 200
####      fftwynik(i,j) = 0;
####    end
####  end
####end
####D0 = 200;
####for i = 1:N
####  for j = 1:M
####    odlegosc = sqrt((N/2 - i)^2 + (M/2 - j)^2);
####    filtr = 1/(1+(sqrt(2)-1)*(odlegosc/D0)^2);
####    fftwynik(i,j) = fftwynik(i,j)*filtr;
####  end
####end
####r = 100;
####
####for i = 1:(N-1)/2-r
####  for j = 1:M
####    fftwynik(i,j) = 0;
####  end
####end
####for i = (N-1)/2+r:N
####  for j = 1:M
####    fftwynik(i,j) = 0;
####  end
####end
####for i = (N-1)/2-r:(N-1)/2+r
####  for j = 1:(M-1)/2-r
####    fftwynik(i,j) = 0;
####  end
####end
####for i = (N-1)/2-r:(N-1)/2+r
####  for j = (M-1)/2+r:(M-1)
####    fftwynik(i,j) = 0;
####  end
####end
##
##
##
##wynikifft = ifft2(fftwynik);
##
##tmp2 = zeros(N,M);
##for i = 1:N
##  for j = 1:M
##    tmp2(i,j) = (real(wynikifft(i,j)))*(-1)^(i+j);
##  end
##end
##tmp2 = uint8(tmp2);
##figure
##imshow(tmp2)

################################################################################

##[image] = imread("http://home.agh.edu.pl/~asiwek/images/moon_corrupted.png");

##image = double(image);
##imshow(uint8(image));
##N = 474;
##M = 630;
##tmp = zeros(N,M);
##
##for i = 1:N
##  for j = 1:M
##    tmp(i,j) = image(i,j)*(-1)^(i+j);
##  end
##end
##
##fftwynik = fft2(tmp);
##widmoMocy = real(fftwynik).^2 + imag(fftwynik).^2;
##maxx = max(max(widmoMocy));
##minn = min(min(widmoMocy));
##widmoMocy = widmoMocy .-minn;
##widmoMocy = widmoMocy .*(255/maxx);
##figure
##imshow(widmoMocy)
##
##for i = 1:N
##  for j = 1:M
##    if sqrt((N/2 - i)^2 + (M/2 - j)^2) > 30
##      fftwynik(i,j) = 0;
##    end
##  end
##end
##
##widmoMocy = real(fftwynik).^2 + imag(fftwynik).^2;
##maxx = max(max(widmoMocy));
##minn = min(min(widmoMocy));
##widmoMocy = widmoMocy .-minn;
##widmoMocy = widmoMocy .*(255/maxx);
##figure
##imshow(widmoMocy)
##
####D0 = 200;
####for i = 1:N
####  for j = 1:M
####    odlegosc = sqrt((N/2 - i)^2 + (M/2 - j)^2);
####    filtr = 1/(1+(sqrt(2)-1)*(odlegosc/D0)^2);
####    fftwynik(i,j) = fftwynik(i,j)*filtr;
####  end
####end
####r = 100;
####
####for i = 1:(N-1)/2-r
####  for j = 1:M
####    fftwynik(i,j) = 0;
####  end
####end
####for i = (N-1)/2+r:N
####  for j = 1:M
####    fftwynik(i,j) = 0;
####  end
####end
####for i = (N-1)/2-r:(N-1)/2+r
####  for j = 1:(M-1)/2-r
####    fftwynik(i,j) = 0;
####  end
####end
####for i = (N-1)/2-r:(N-1)/2+r
####  for j = (M-1)/2+r:(M-1)
####    fftwynik(i,j) = 0;
####  end
####end
##
##
##
##wynikifft = ifft2(fftwynik);
##
##tmp2 = zeros(N,M);
##for i = 1:N
##  for j = 1:M
##    tmp2(i,j) = (real(wynikifft(i,j)))*(-1)^(i+j);
##  end
##end
##tmp2 = uint8(tmp2);
##figure
##imshow(tmp2)


################################################################################

[image] = imread("http://home.agh.edu.pl/~asiwek/images/lena_corrupted.png");

imshow(image)

N = 512;

for i = 2:N-1
  for j = 2:N-1
    image(i,j) = sum(sum(image(i-1:i+1,j-1:j+1)))/9;
  end
end

figure
imshow(image)










