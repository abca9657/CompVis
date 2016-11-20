filename1 = 'face1.jpg';

color_face = imread(filename1);

Viola_Jones_img( color_face )

gray_face  = rgb2gray(color_face);