function [res]=motion(img,T,a,b)
  [h,w]=size(img);
  spectru=fftshift(fft2(img));
  u=[1:h]-h/2;
  v=[1:w]-w/2;
  [V,U]=meshgrid(v,u);
  termen=pi*(a.*U+b.*V);
  H=T*sin(termen).*exp(-j*termen)./termen;
  H(termen<=0.0001)=0.1;
  degraded=H.*spectru;
  res=(real(ifft2(ifftshift(degraded))))/255;
 %u = [1:(2*M)] - M ;
 %v = [1:(2*N)] - N ;
 %[V, U] = meshgrid(v, u);
 %D = (V .* b + U .* a) .* pi;
 %output = ones(2*M, 2*N) .* T ./ D .* sin(D) .* exp(-j * D);
 %output(D == 0) = 1;
endfunction
