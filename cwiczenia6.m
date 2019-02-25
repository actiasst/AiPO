clc
clear all
close all
warning('off','all');

pkg load image

[image] = imread("C:\\Users\\Lord Actias\\Downloads\\znaki.png");
mono = 0.2989*image(:,:,1) + 0.5870*image(:,:,2) + 0.1140 *image(:,:,3);
binary = (mono > 120);
imshow(binary);
binarytmp = binary;
N = 567;
M = 964;

for k = 1:N
  for l = 1:M
    if binarytmp(k,l) == 1;
      amplituda = 1;
      sumNext = 0;
      sumPrev = 0;
      startx = l;
      starty = k;
      tmp = zeros(N,M);
        while(1)
          for i = starty-amplituda:starty+amplituda
            for j = startx-amplituda:startx+amplituda
              if i < 1;
                i = 1;
              endif
              if i > N;
                i = N;
              endif
              if j < 1;
                j = 1;
              endif
              if j > M;
                j = M;
              endif
              if binarytmp(i,j) == 1;
                tmp(i,j) = 1;
                tmp(i-1,j) = 1;
                tmp(i+1,j) = 1;
                tmp(i,j-1) = 1;
                tmp(i,j+1) = 1;
              endif
            endfor
          endfor
          amplituda++;
          tmp = tmp & binary;
          sumNext = sum(tmp(:));
          if sumPrev == sumNext;
            break
          endif
          sumPrev = sumNext;
        endwhile
      binarytmp = binarytmp - tmp;
      figure
      imshow(tmp)
      sr_w = 0;
      sr_d = 0;
      ilosc = 0;
        for ii = starty-amplituda:starty+amplituda
          for jj = startx-amplituda:startx+amplituda
            if(tmp(ii,jj) == 1)
              sr_w+=ii;
              sr_d+=jj;
              ilosc += 1;
            endif
          end
        end
      hold on
      plot(sr_d/ilosc,sr_w/ilosc,'g+');
      x = floor(sr_d/ilosc)
      y = floor(sr_w/ilosc)
################################################################################
      ##momenty
      Ix = 0;
      Iy = 0;
        for ii = starty-amplituda:starty+amplituda
          for jj = startx-amplituda:startx+amplituda
            Ix += tmp(ii,jj) * (abs(y - ii)^2);
            Iy += tmp(ii,jj) * (abs(x - jj)^2);
          end
        end
      Ix
      Iy
      #deskryptory
      obwod = 0;
        for ii = starty-amplituda:starty+amplituda
          for jj = startx-amplituda:startx+amplituda
            if tmp(ii,jj) != 1
              sumTmp = sum(sum(tmp(ii-1:ii+1,jj-1:jj+1)));
              if sumTmp > 1
                obwod += 1;
              end
            end
          end
        end
      obwod
      powierzchnia = sum(sum(tmp))
      zwartosc_obszaru = (obwod^2)/powierzchnia
################################################################################      
    end
  end
end


################################################################################
##A = imread("C:\\Users\\Lord Actias\\Downloads\\rys_A.png");
##monoA = 0.2989*A(:,:,1) + 0.5870*A(:,:,2) + 0.1140 *A(:,:,3);
##binaryA = (monoA > 120);
##AN = 113;
##AM = 113;
##max = 0;
##imax = 0;
##jmax = 0;
##for i = 1:N-AN
##  for j = 1:M-AM
##    tmp = binary(i:i+AN-1,j:j+AM-1) & binaryA;
##    tmpSum = sum(sum(tmp));
##    if tmpSum > max
##      max = tmpSum;
##      imax = i;
##      jmax = j;
##    end
##  end
##end
##
##hold on
##plot(jmax,imax,'g+')
##plot(jmax,imax+AM,'g+')
##plot(jmax+AN,imax,'g+')
##plot(jmax+AN,imax+AM,'g+')

##F = imread("C:\\Users\\Lord Actias\\Downloads\\rys_=.png");
##monoF = 0.2989*F(:,:,1) + 0.5870*F(:,:,2) + 0.1140 *F(:,:,3);
##binaryF = (monoF > 120);
##FN = 113;
##FM = 113;
##max = 0;
##imax = 0;
##jmax = 0;
##licznik = 0;
##pole = N*M;
##for i = 1:N-FN
##  for j = 1:M-FM
##    tmp = binary(i:i+FN-1,j:j+FM-1) & binaryF;
##    tmpSum = sum(sum(tmp));
##    licznik++;
##    if tmpSum > max
##      max = tmpSum;
##    end
##  end
##  licznik/pole;
##end
##
##licznik = 0;
##
##for i = 1:N-FN
##  for j = 1:M-FM
##    tmp = binary(i:i+FN-1,j:j+FM-1) & binaryF;
##    tmpSum = sum(sum(tmp));
##    licznik++;
##    if tmpSum == max
##      imax = i
##      jmax = j
##      hold on
##      plot(jmax,imax,'g+')
##      plot(jmax,imax+FM,'g+')
##      plot(jmax+FN,imax,'g+')
##      plot(jmax+FN,imax+FM,'g+')
##    end
##  end
##  licznik/pole
##end





















