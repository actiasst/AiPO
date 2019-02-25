clc
clear all
close all
warning('off','all');

pkg load image

[binary] = imread("C:\\Users\\Lord Actias\\Desktop\\obrazki\\testowy\\1 2533 14096 5122 1861.0.png");

imshow(binary)

N = 2368;
M = 4208;


      #deskryptory
      obwod = 0;
        for ii = 2:140
          for jj = 2000:M-1
            if binary(ii,jj) != 1
              sumTmp = sum(sum(binary(ii-1:ii+1,jj-1:jj+1)));
              if sumTmp > 1
                obwod += 1;
              end
            end
          end
        end
      obwod
      powierzchnia = sum(sum(binary))
      zwartosc_obszaru = (obwod^2)/powierzchnia