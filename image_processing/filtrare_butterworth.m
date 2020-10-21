function filtrare_butterworth(img,radius,n)
  %in fisierul filtrare este tratat cazul ideal
  %aici se foloseste butterworth filter
  %lowpass în forma curent?,highpass daca se inverseaz? raportul
  %norm(...)/radius
  s=fft2(img);
  base=zeros(size(img));
  [h,w]=size(img);
  center=[h/2,w/2];
  for x=1:h
    for y=1:w
        base(x,y)=1/(1+power(norm([x,y]-center)/radius,2*n));
    endfor
  endfor
  s_shift=fftshift(s);
  s_shift=s_shift.*base;
  is=ifftshift(s_shift);
  recovered=ifft2(is);
  imshow(uint8(real(recovered)));
endfunction
