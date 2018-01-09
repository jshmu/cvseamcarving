% File Name: rmHorSeam.m
% Author:
% Date:

function [Iy, E] = rmHorSeam(I, My, Tby)
% Input:
%   I is the image. Note that I could be color or grayscale image. n x m
%   My is the cumulative minimum energy map along horizontal direction. n x m
%   Tby is the backtrack table along horizontal direction. n x m

% Output:
%   Iy is the image removed one row. n-1 x m
%   E is the cost of seam removal

% Write Your Code Here
r=find(My(:,end)==min(My(:,end))); %column number of min end value
pos = randi(length(r));
r = r(pos);
E=My(r,end);

seam_row=zeros(1,size(I,2));
seam_row(end)=r;
seam_col=1:size(I,1);

for i=size(I,2):-1:1
    if Tby(r,i)==1
        r=r+1;
    elseif Tby(r,i)==-1
        r=r-1; 
    end
    seam_row(i)=r;
end

Iy=I([1:seam_row-1 seam_row+1:end],:,:);

end