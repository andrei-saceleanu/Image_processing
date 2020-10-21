function template_matching(image,template)
  [h1,w1]=size(image);
  [h2,w2]=size(template);
  ga=fft2(image);
  gb=fft2(template,h1,w1);
  cross=real(ifft2(ga.*conj(gb)./(abs(ga.*conj(gb)))));
  [maximum,index]=max(abs(cross(:)));
  [y,x]=find(abs(cross-maximum)<0.04);
  imshow(image);
  hold on;
  for i=1:length(y)
    rectangle("Position",[x(i),y(i),w2,h2],"EdgeColor",[1,0,0]);
  endfor
  %scatter(x,y);
  %scatter(x+w2,y);
  %scatter(x,y+h2);
  %scatter(x+w2,y+h2);
endfunction
