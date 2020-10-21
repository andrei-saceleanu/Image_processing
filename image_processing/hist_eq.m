function [res_hist]=hist_eq(img,L)
  p=zeros(1,L);
  [h,w]=size(img);
  for intensity=0:L-1
    p(intensity+1)=nnz(img==intensity)/(h*w);
  endfor
  res_hist=zeros(h,w);
  for i=1:h
    for j=1:w
      res_hist(i,j)=(L-1)*sum(p(1:(img(i,j)+1)));
    endfor
  endfor
  res_hist=res_hist/255;
  
endfunction
