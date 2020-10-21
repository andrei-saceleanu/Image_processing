function [res]=laplacian(img,sigma)
  [h,w]=size(img);
  base=zeros(h,w);
  center=[h/2,w/2];
  s=fft2(img);
  for x=1:h
    for y=1:w
      base(x,y)=-(1-norm([x,y]-center)^2/2*sigma*sigma)*exp(-(norm([x,y]-center)^2)/(2*sigma*sigma))/(pi*sigma^4);
    endfor
  endfor
  
  s=s.*base;
  res=ifft2(s);
  imshow(img-uint8(real(res)));
  
endfunction
