function image_compression(img,thresholds)
  %Compresie imagine grayscale
  %
  %Utilizare
  %image_compression(img,thresholds)
  %
  %-Inputs-
  %img=imagine asupra careia se realizeaza operatia
  %thresholds=vector cu diferite margini inferioare pentru compresie
  %!!thresholds ar trebui sa aiba maxim 8 elemente
  %
  %Rezultat
  %Se afiseaza imaginile obtinute pentru fiecare element din thresholds
  
  img_t=fft2(img);
  [h w]=size(img);
  i=1;
  %pentru fiecare threshold,se selecteaz? acei pixeli din transformata
  %care au modulul mai mare
  for th=0.1*thresholds*max(max(abs(img_t)))
    indices=abs(img_t)>th;
    count=sum(sum(indices));%num?r de coeficienti pastrati
    imgt_compressed=img_t.*indices;
    percent=(count/(h*w))*100;
    img_compressed=uint8(real(ifft2(imgt_compressed)));%reconversie
    %afisare imagine aferenta fiecarui element din threshold
    figure(1);
    subplot(4,2,i);
    imshow(img_compressed);
    title([num2str(percent) '% din coeficienti abs(FFT) pastrati'],'FontSize',12);
    i+=1;
  endfor
endfunction
