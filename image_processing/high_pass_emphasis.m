function [res]=high_pass_emphasis(img,k1,k2,radius)
  s=fft2(img);
  base=zeros(size(img));
  [h,w]=size(img);
  center=[h/2,w/2];
  for x=1:h
    for y=1:w
      base(x,y)=k1+k2*(1-exp(-((norm([x,y]-center)/radius)^2)/2));
    endfor
  endfor
  s_shift=fftshift(s);
  s_shift=s_shift.*base;
  is=ifftshift(s_shift);
  recovered=ifft2(is);
  res=uint8(real(recovered));
  imshow(uint8(real(recovered)));
endfunction
