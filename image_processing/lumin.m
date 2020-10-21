function lumin(img)
  %Modificare luminozitate imagine grayscale
  s=fft2(img);
  for i=0:pi/180:pi/3
    phases=ones(size(img))*exp(j*i);    
    st=s.*phases;
    imshow(uint8(real(ifft2(st))));
    pause(1);
  endfor
  %in loc de un numar complex de modul 1,s-ar putea folosi
  %si numere de alt modul/strict reale/...
  %am observat ca cele de modul unu,pentru imaginea pe care am testat,
  %întuneca imaginea pana devine complet neagra la aprox. 70 grade faza
  %daca sunt exclusiv reale,cele supraunitare cresc luminozitatea iar
  %cele subunitare scad
endfunction
