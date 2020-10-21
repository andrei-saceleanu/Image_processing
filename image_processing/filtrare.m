function filtrare(img,radius)
  %High-pass filter/Low-pass filter
  %Cum este fisierul acum este high-pass si poate fi folosit
  %la evidentierea marginilor(edge detection)
  %schimbând semnul inegalitatii ***,am avea low-pass,
  %poate fi folosit la detectarea/evidentierea zonelor contigue
  %https://medium.com/@hicraigchen/digital-image-processing-using-fourier-transform-in-python-bcb49424fd82
  s=fft2(img);
  base=zeros(size(img));
  [h,w]=size(img);
  center=[h/2,w/2];
  for x=1:h
    for y=1:w
      if norm([x,y]-center)>=radius %***
        base(x,y)=1;
      endif
    endfor
  endfor
  %u=[(1:h)-h/2];
  %v=[(1:w)-w/2];
  %[U,V]=meshgrid(u,v);
  %D=U.^2+V.^2;
  %base(D>=radius)=1;
  %
  s_shift=fftshift(s);
  s_shift=s_shift.*base;
  is=ifftshift(s_shift);
  recovered=ifft2(is);
  imshow(uint8(real(recovered)));
endfunction
