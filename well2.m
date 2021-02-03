clear;

img = imread('well2.png');
img = im2bw(img,0.35);


I=img;
F=fftshift(fft2(I));   
%F=fft2(I);   
phase = angle(F);
%IF =ifft2(fftshift(F));
absolute = abs(F) ; 

for ii=1:603
    if (ii < 300) || (ii>308)
        absolute(ii,1282)=0;
    end
end


imshow(log(1+absolute),[])

[x,y]  = size(absolute);
% for ii=1:x
%     for jj=1:y
%         if ii>1000 || jj>200
%             absolute(ii,jj)  = 0;
%         end
%     end
% end
fftimg = complex(absolute .* cos(phase),absolute .* sin(phase) ); 
img =ifft2(ifftshift(fftimg));
%img =ifft2(fftimg);
figure
imshow(img);





% horizontalEdgeImage = imfilter(img, [-1 0 1]);
% % img3 = medfilt2(img2);
% % img3 = imfilter(img3, [1 1 1;1 1 1;1 1 1]');
% img3= imfilter(img3, [-1 0 1]);
% imshow(img3)
