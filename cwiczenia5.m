clc
clear all
close all
warning('off','all');

pkg load image

##[image] = imread("http://home.agh.edu.pl/~asiwek/images/kulki.jpg");
##mono = 0.2989*image(:,:,1) + 0.5870*image(:,:,2) + 0.1140 *image(:,:,3);
##binary = (mono > 215);
##binary = !binary;
##
##figure
##imshow(binary)
##
##tmp = zeros(124,200);
##tmp = logical(tmp);
##
##srednia = 0;
##for i = 2:123
##  for j = 2:199
##    srednia = sum(sum(binary(i-1:i+1,j-1:j+1)))/9;
##    if srednia > 0.3;
##      tmp(i,j) = 1;
##    end
##  end
##end
##
##binary = tmp;
##
##tmp = zeros(124,200);
##
##startx = 75;
##starty = 69;
##amplituda = 1;
##sumPrev = 0;
##sumNext = 0;
##
##tmp(starty,startx) = 1;
##
##while(1)
##for i = starty-amplituda:starty+amplituda
##  for j = startx-amplituda:startx+amplituda
##    if i < 1;
##      i = 1;
##    endif
##    if i > 124;
##      i = 124;
##    endif
##    if j < 1;
##      j = 1;
##    endif
##    if j > 200;
##      j = 200;
##    endif
##    if binary(i,j)
##      continue
##    endif
##    if tmp(i,j) == 1;
##      tmp(i,j) = 1;
##      tmp(i-1,j) = 1;
##      tmp(i+1,j) = 1;
##      tmp(i,j-1) = 1;
##      tmp(i,j+1) = 1;
##    endif
##  endfor
##endfor
##
##amplituda++;
##tmp = tmp & !binary;
##sumNext = sum(tmp(:));
##
##if sumPrev == sumNext;
##  break
##endif
##sumPrev = sumNext;
##
##endwhile
##tmp = tmp | binary;
##binary = tmp;

#####
##tmp = zeros(124,200);
##
##startx = 48;
##starty = 36;
##amplituda = 1;
##sumPrev = 0;
##sumNext = 0;
##
##tmp(starty,startx) = 1;
##
##while(1)
##for i = starty-amplituda:starty+amplituda
##  for j = startx-amplituda:startx+amplituda
##    if i < 1;
##      i = 1;
##    endif
##    if i > 124;
##      i = 124;
##    endif
##    if j < 1;
##      j = 1;
##    endif
##    if j > 200;
##      j = 200;
##    endif
##    if binary(i,j)
##      continue
##    endif
##    if tmp(i,j) == 1;
##      tmp(i,j) = 1;
##      tmp(i-1,j) = 1;
##      tmp(i+1,j) = 1;
##      tmp(i,j-1) = 1;
##      tmp(i,j+1) = 1;
##    endif
##  endfor
##endfor
##
##amplituda++;
##tmp = tmp & !binary;
##sumNext = sum(tmp(:));
##
##if sumPrev == sumNext;
##  break
##endif
##sumPrev = sumNext;
##
##endwhile
##tmp = tmp | binary;
##binary = tmp;
##
#####
##tmp = zeros(124,200);
##
##startx = 97;
##starty = 80;
##amplituda = 1;
##sumPrev = 0;
##sumNext = 0;
##
##tmp(starty,startx) = 1;
##
##while(1)
##for i = starty-amplituda:starty+amplituda
##  for j = startx-amplituda:startx+amplituda
##    if i < 1;
##      i = 1;
##    endif
##    if i > 124;
##      i = 124;
##    endif
##    if j < 1;
##      j = 1;
##    endif
##    if j > 200;
##      j = 200;
##    endif
##    if binary(i,j)
##      continue
##    endif
##    if tmp(i,j) == 1;
##      tmp(i,j) = 1;
##      tmp(i-1,j) = 1;
##      tmp(i+1,j) = 1;
##      tmp(i,j-1) = 1;
##      tmp(i,j+1) = 1;
##    endif
##  endfor
##endfor
##
##amplituda++;
##tmp = tmp & !binary;
##sumNext = sum(tmp(:));
##
##if sumPrev == sumNext;
##  break
##endif
##sumPrev = sumNext;
##
##endwhile
##tmp = tmp | binary;
##binary = tmp;
#####
##tmp = zeros(124,200);
##
##startx = 136;
##starty = 81;
##amplituda = 1;
##sumPrev = 0;
##sumNext = 0;
##
##tmp(starty,startx) = 1;
##
##while(1)
##for i = starty-amplituda:starty+amplituda
##  for j = startx-amplituda:startx+amplituda
##    if i < 1;
##      i = 1;
##    endif
##    if i > 124;
##      i = 124;
##    endif
##    if j < 1;
##      j = 1;
##    endif
##    if j > 200;
##      j = 200;
##    endif
##    if binary(i,j)
##      continue
##    endif
##    if tmp(i,j) == 1;
##      tmp(i,j) = 1;
##      tmp(i-1,j) = 1;
##      tmp(i+1,j) = 1;
##      tmp(i,j-1) = 1;
##      tmp(i,j+1) = 1;
##    endif
##  endfor
##endfor
##
##amplituda++;
##tmp = tmp & !binary;
##sumNext = sum(tmp(:));
##
##if sumPrev == sumNext;
##  break
##endif
##sumPrev = sumNext;
##
##endwhile
##tmp = tmp | binary;
##binary = tmp;
#####
##tmp = zeros(124,200);
##
##startx = 148;
##starty = 27;
##amplituda = 1;
##sumPrev = 0;
##sumNext = 0;
##
##tmp(starty,startx) = 1;
##
##while(1)
##for i = starty-amplituda:starty+amplituda
##  for j = startx-amplituda:startx+amplituda
##    if i < 1;
##      i = 1;
##    endif
##    if i > 124;
##      i = 124;
##    endif
##    if j < 1;
##      j = 1;
##    endif
##    if j > 200;
##      j = 200;
##    endif
##    if binary(i,j)
##      continue
##    endif
##    if tmp(i,j) == 1;
##      tmp(i,j) = 1;
##      tmp(i-1,j) = 1;
##      tmp(i+1,j) = 1;
##      tmp(i,j-1) = 1;
##      tmp(i,j+1) = 1;
##    endif
##  endfor
##endfor
##
##amplituda++;
##tmp = tmp & !binary;
##sumNext = sum(tmp(:));
##
##if sumPrev == sumNext;
##  break
##endif
##sumPrev = sumNext;
##
##endwhile
##tmp = tmp | binary;
##binary = tmp;

##figure
##imshow(binary)
################################################################################
[image] = imread("http://home.agh.edu.pl/~asiwek/images/tools.jpg");
mono = 0.2989*image(:,:,1) + 0.5870*image(:,:,2) + 0.1140 *image(:,:,3);
binary = (mono > 110);
binary = !binary;
imshow(binary);
wymiar = 1200*1200;


##############################
tmp = zeros(1200,1200);
licznik = 0;

for i =3:1198
  for j = 3:1198
    if binary(i,j) == 1;
      tmp(i-1:i+1,j-1:j+1) = 1;
    end
    licznik++;
  end
  licznik/(wymiar)
end

binary = tmp;

tmp = zeros(1200,1200);
srednia = 0;
licznik = 0;
wymiar = 1200*1200;
for i =3:1198
  for j = 3:1198
    srednia = sum(sum(binary(i-2:i+2,j-2:j+2)));
    if(srednia/25 == 1)
      tmp(i,j) = 1;
    end
    licznik++;
  end
  licznik/(wymiar)
end

binary = tmp;
################################################################################
tmp = zeros(1200,1200);
srednia = 0;
licznik = 0;
for i =3:1198
  for j = 3:1198
    srednia = sum(sum(binary(i-2:i+2,j-2:j+2)));
    if(srednia/25 == 1)
      tmp(i,j) = 1;
    end
    licznik++;
  end
  licznik/(wymiar)
end

binary = tmp;


tmp = zeros(1200,1200);
licznik = 0;

for i =3:1198
  for j = 3:1198
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

################################################################################

x1 = 0;
x2 = 0;
y1 = 0;
y2 = 0;
krok = 0;
krokPrev = 0;
licznikPrzejsc = 0;


for i = 1:110
  for j = 1:1200
    krok = binary(i,j);
    if krokPrev != krok;
      licznikPrzejsc++;
      if licznikPrzejsc == 3;
        x2 = j;
        for k = i:-1:1
          if binary(k,floor((x2-x1)/2)) == 0;
            y1 = k;
            break
          end
        end
        for k = i:1200
          if binary(k,floor((x2-x1)/2)) == 0;
            y2 = k;
            break
          end
        end
        licznikPrzejsc = 0;
        break
      end
      if licznikPrzejsc == 2;
        x1 = j;
      end
    end
    krokPrev = krok;
  end
    licznikPrzejsc = 0;
end


















