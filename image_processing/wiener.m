function [res]=wiener(F,N,H)
  H2=abs(H).^2;
  Sn=abs(fftshift(fft2(N))).^2;
  Sf=abs(F).^2;
  res=(H2 ./ H ./ (H2 + Sn ./ Sf));
endfunction
