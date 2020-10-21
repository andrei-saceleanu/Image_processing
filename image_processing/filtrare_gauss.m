function [res]=filtrare_gauss(img,radius)
  %filtrarea gaussiana
  %lowpass în forma actual?,highpass daca base(x,y)=1-expresie
  s=fft2(img);
  base=zeros(size(img));
  [h,w]=size(img);
  center=[h/2,w/2];
  for x=1:h
    for y=1:w
      base(x,y)=1-exp(-((norm([x,y]-center)/radius)^2)/2);
    endfor
  endfor
  %u=[(1:h)-h/2];
  %v=[(1:w)-w/2];
  %[U,V]=meshgrid(u,v);
  %D=U.^2+V.^2;
  %base=1-exp(-D./(2*(radius^2)));
  %
  s_shift=fftshift(s);
  s_shift=s_shift.*base;
  is=ifftshift(s_shift);
  recovered=ifft2(is);
  res=uint8(real(recovered));
  imshow(uint8(real(recovered)));
endfunction
