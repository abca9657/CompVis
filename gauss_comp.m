%% Gaussian Equation Computation by Abbigail Caballero
% Class: Computer Vision, CSCI 4830
% Instructor: Ioana Fleming
% Assignment 1

function [retVal] = gauss_comp(x,y,sig)
% do gaussian calculation:
par2 = exp(-(x^2 + y^2)/(2*sig^2));
par1 = 1/(2*pi*sig^2);
retVal = par1*par2;
end