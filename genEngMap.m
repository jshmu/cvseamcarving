% File Name: genEngMap.m

function e = genEngMap(I)
% Input:
%   I is an image. I could be of color or grayscale. string for jpg file

% Output:
%   e is the energy map of n-by-m matrix.
% I=imread(I);

if ndims(I) == 3
    % Assume the image fed in is a 3-channel RGB color image
    Ig = double(rgb2gray(I)); 
else
    % Assume the image fed in is a grayscale image
    Ig = double(I);
end

[gx, gy] = gradient(Ig);
e = abs(gx) + abs(gy);
end