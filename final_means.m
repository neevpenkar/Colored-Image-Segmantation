clc; clear;
p1 = "dog2.jpg";
im = imread(p1);

% Get center of circle from user
[bim, fim, fmsk] = splitImageFromUser(im);
close all;

% Take input about colors:
fcolors = input("How many colors in the selected area: ");
bcolors = input("How many colors in the background area: ");

% Segmentation
bim = segmentImage(bim, bcolors+1);
fim = segmentImage(fim, fcolors+1);

finalim = multiplyMask(fim, fmsk) + multiplyMask(bim, 1 - fmsk);
imshow(finalim);
imwrite(finalim, "dog_2.png");

function [bg,fg,fgmask] = splitImageFromUser(im)
    fig = imshow(im);
    a = impoly;
    b = a.getPosition();
    
    xs = b(:,1);
    ys = b(:,2);
    
    fgmask = roipoly(im,xs,ys);
    bgmask = not(fgmask);
    bgmask = uint8(bgmask);
    fgmask = uint8(fgmask);
    
    bg = im;
    fg = im;
    
    bg = multiplyMask(bg, bgmask);
    fg = multiplyMask(fg, fgmask);
end
function image = multiplyMask(im, msk)
    im(:,:,1) = im(:,:,1) .* msk;
    im(:,:,2) = im(:,:,2) .* msk;
    im(:,:,3) = im(:,:,3) .* msk;
    image = im;
end
function im = segmentImage(image, num)
    [L,C] = imsegkmeans(image,num);
    im = label2rgb(L,im2double(C));
end