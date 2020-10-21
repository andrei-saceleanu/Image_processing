function [res]=fuzzy(i)
  vd=0;
  a=80;
  vg=127;
  b=170;
  vb=255;
  img=double(i);
  [h,w]=size(img);
  res=zeros(h,w);
  mu1=cast(0,"double");
  mu2=cast(0,"double");
  mu3=cast(0,"double");
  for i=1:h
    for j=1:w
      if(img(i,j)>80&&img(i,j)<127)
        mu1=(vg-img(i,j))/(vg-a);
        mu2=(img(i,j)-a)/(vg-a);
        mu3=0;
      endif
      if(img(i,j)>=127&&img(i,j)<170)
        mu1=0;
        mu2=(b-img(i,j))/(b-vg);
        mu3=(img(i,j)-vg)/(b-vg);
      endif 
      if img(i,j)>=170
        mu1=0;
        mu2=0;
        mu3=1;
      endif
      if(img(i,j)<=a)
        mu1=1;
        mu2=0;
        mu3=0;
      endif
      res(i,j)=(mu1*vd+mu2*vg+mu3*vb)/(mu1+mu2+mu3);
    endfor
  endfor
endfunction
