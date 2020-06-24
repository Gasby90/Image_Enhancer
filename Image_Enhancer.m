%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%% Image Enhancer %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%% Riccardo Gasbarrone 2016 %%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

RGB = imread('immagine.png');
imshow(RGB)
%%converting to gray scale
GRA = rgb2gray(RGB);
figure
imshow(GRA)
whos
%%contrast enhancing
ENH =histeq(GRA);
figure
imshow (ENH)
%% Saving image contrast
imwrite(ENH,'enhanc_gray_image.jpg')
%% show info
imfinfo('enhanc_gray_image.jpg')
%transferring RGB image into an index image
[x,map]=rgb2ind(RGB,16);
imshow(RGB),figure,imshow(x,map)
%% Intensity values adjustment
lh = stretchlim(RGB);
I2 = imadjust(RGB,lh,[]);
imshow(I2)
I3 = imadjust(RGB,lh,[],0.5);
I4 = imadjust(RGB,lh,[],1.5);
figure
subplot(2,2,1), imshow(RGB), title('Original Image')
subplot(2,2,2), imshow(I2), title('Adjusted Image, Gamma=1.0')
subplot(2,2,3), imshow(I3), title('Adjusted Image, Gamma=0.5')
subplot(2,2,4), imshow(I4), title('Adjusted Image, Gamma=1.5')
% Visualize hystogram of the red color (Distribution of intensities)
figure
subplot(2,2,1), imhist(RGB(:,:,1)), title('Original Image')
subplot(2,2,2), imhist(I2(:,:,1)), title('Adjusted Image, Gamma=1.0')
subplot(2,2,3), imhist(I3(:,:,1)), title('Adjusted Image, Gamma=0.5')
subplot(2,2,4), imhist(I4(:,:,1)), title('Adjusted Image, Gamma=1.5')
%enhancement of the image
I5(:,:,1) = histeq(RGB(:,:,1),50);
I5(:,:,2) = histeq(RGB(:,:,2),50);
I5(:,:,3) = histeq(RGB(:,:,3),50);
figure
subplot(2,2,1), imshow(RGB), title('Original Image')
subplot(2,2,3), imhist(RGB(:,:,1)), title('Original Image')
subplot(2,2,2), imshow(I5), title('Enhanced Image')
subplot(2,2,4), imhist(I5(:,:,1)), title('Enhanced Image')
%using gaussian filter
h = fspecial('gaussian',20,10);
I8(:,:,1) = medfilt2(RGB(:,:,1),[20 20]);
I8(:,:,2) = medfilt2(RGB(:,:,2),[20 20]);
I8(:,:,3) = medfilt2(RGB(:,:,3),[20 20]);
I7 = imfilter(RGB,h);
%image sharpening
I9 = imsharpen(RGB);
%showing images
figure
subplot(2,2,1), imshow(RGB), title('Original Image')
subplot(2,2,2), imshow(I7), title('Gaussian Filter')
subplot(2,2,3), imshow(I8), title('Median Filter')
subplot(2,2,4), imshow(I9), title('Sharpening Filter')
