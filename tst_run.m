filename1 = 'face1.jpg';

color_face = imread(filename1);
tic
Viola_Jones_img( color_face )
toc
gray_face  = rgb2gray(color_face);
% gaus_1 = gaussFilter(color_face,1);
% gaus_2 = gaussFilter(color_face,2);
% gaus_10 = gaussFilter(color_face,10);