function [res]=dilation(img,h,w)
  [H,W]=size(img);
  h2=(h-1)/2;
  w2=(w-1)/2;
  T=zeros(H+2*h2,W+2*w2);
  T(h2+1:h2+H,w2+1:w2+W)=img;
  res=img;
  for i=h2+1:h2+H
    for j=w2+1:w2+W
      t=T(i-h2:i+h2,j-w2:j+w2)(:);
      res(i-h2,j-w2)=max(t);
    endfor
  endfor
endfunction
