function [res]=max_filter(img,h,w)
  [H,W]=size(img);
  T=zeros(H+2*h-2,W+2*w-2);
  T(h:h+H-1,w:w+W-1)=img;
  res=img;
  for i=1:H+h-1
    for j=1:W+w-1
      t=T(i:i+h-1,j:j+w-1)(:);
      res(i,j)=max(t);
    endfor
  endfor
endfunction
