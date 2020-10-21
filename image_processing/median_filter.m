function [res]=median_filter(img,n)
  [h,w]=size(img);
  res=zeros(h,w);
  x=floor(n/2);
  padded=zeros(h+n-1,w+n-1);
  padded(1+x:1+x+h-1,1+x:1+x+w-1)=img;
  for i=1+x:1+x+h-1
    for j=1+x:1+x+w-1
      v=padded(i-x:i+x,j-x:j+x)(:);
      res(i-x,j-x)=median(v);
    endfor
  endfor
endfunction
