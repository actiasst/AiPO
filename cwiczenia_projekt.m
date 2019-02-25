clc
clear all
close all
warning('off','all');

pkg load image

[image] = imread("C:\\Users\\Lord Actias\\Desktop\\obrazki\\test.png");

mono = 0.2989*image(:,:,1) + 0.5870*image(:,:,2) + 0.1140 *image(:,:,3);

N = floor(2368);
M = floor(4208);
binary = mono > 150;
binary = !binary;


#imshow(binary)

tmp = zeros(N,M);
tmpVariable = 3;
srednia = 0;
licznik = 0;
wymiar = N*M;
for i =tmpVariable+1:N-tmpVariable
  for j = tmpVariable+1:M-tmpVariable
    srednia = sum(sum(binary(i-tmpVariable:i+tmpVariable,j-tmpVariable:j+tmpVariable)));
    if(srednia/49 == 1)
      tmp(i,j) = 1;
    end
    licznik++;
  end
  licznik/(wymiar)
end

binary = tmp;

figure
imshow(binary)

tmp = zeros(N,M);
licznik = 0;

for i =tmpVariable+1:N-tmpVariable
  for j = tmpVariable+1:M-tmpVariable
    if binary(i,j) == 1;
      tmp(i-1:i+1,j-1:j+1) = 1;
    end
    licznik++;
  end
  licznik/(wymiar)
end

binary = tmp;
figure
imshow(binary)

#####Koniec dylatacji i erozji
##
##numer = 4;
##binarytmp = binary;
##for k = 1:N
##  for l = 1:M
##    if binarytmp(k,l) == 1;
##      amplituda = 1;
##      sumNext = 0;
##      sumPrev = 0;
##      startx = l;
##      starty = k;
##      tmp = zeros(N,M);
##      tmp(k,l) = 1;
##        while(1)
##          for i = starty-amplituda:starty+amplituda
##            for j = startx-amplituda:startx+amplituda
##              if i < 1;
##                i = 1;
##              endif
##              if i > N;
##                i = N;
##              endif
##              if j < 1;
##                j = 1;
##              endif
##              if j > M;
##                j = M;
##              endif
##              if binarytmp(i,j) == 1;
##                if sum(sum(tmp(i-1:i+1,j-1:j+1))) > 0
##                  tmp(i-1:i+1,j-1:j+1) = 1;
##                endif
##              endif
##            endfor
##          endfor
##          amplituda++;
##          tmp = tmp & binary;
##          sumNext = sum(tmp(:));
##          if sumPrev == sumNext;
##            break
##          endif
##          sumPrev = sumNext;
##        endwhile
##      binarytmp = binarytmp - tmp;
##      figure
##      imshow(tmp)
##################################################################################
##      #deskryptory
##      numer
##      numer++;
##      obwod = 0;
##        for ii = starty-amplituda:starty+amplituda
##          for jj = startx-amplituda:startx+amplituda
##            if ii < 2;
##                ii = 2;
##              endif
##              if ii > N-1;
##                ii = N-1;
##              endif
##              if jj < 2;
##                jj = 2;
##              endif
##              if jj > M-1;
##                jj = M-1;
##              endif
##            if tmp(ii,jj) != 1
##              sumTmp = sum(sum(tmp(ii-1:ii+1,jj-1:jj+1)));
##              if sumTmp > 1
##                obwod += 1;
##              end
##            end
##          end
##        end
##      obwod
##      powierzchnia = sum(sum(tmp))
##      zwartosc_obszaru = (obwod^2)/powierzchnia
##################################################################################      
##    end
##  end
##end
