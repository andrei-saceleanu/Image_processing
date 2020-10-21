function [res]=inverse_filter(img)
  [h,w]=size(img);
  G=fft2(img);
  G=fftshift(G);
  u=[(1:h)-h/2];
  v=[(1:w)-w/2];
  [V,U]=meshgrid(v,u);
  termen=pi*(0.1.*U+0.1.*V);
  H=(sin(termen).*exp(-j*termen))./termen;
  H(termen==0)=1;
  F=G./H;
  F(abs(F)>1000000000)=1;
  imshow((abs(F)))
  res=(real(ifft2(ifftshift(F))));
endfunction
