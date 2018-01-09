% File Name: rmVerSeam.m
% Author:
% Date:

function [Ix, E] = rmVerSeam(I, Mx, Tbx)
% Input:
%   I is the image. Note that I could be color or grayscale image. n x m
%   Mx is the cumulative minimum energy map along vertical direction. n x m
%   Tbx is the backtrack table along vertical direction. n x m

% Output:
%   Ix is the image removed one column.  n x m-1
%   E is the cost of seam removal

% Write Your Code Here

c=find(Mx(end,:)==min(Mx(end,:))); %column number of min end value
pos = randi(length(c));
c = c(pos);
E=Mx(end,c);

seam_col=zeros(1,size(I,1));
seam_col(end)=c;
seam_row=1:size(I,2);

for i=size(I,1):-1:1
    if Tbx(i,c)==1
        c=c+1;
    elseif Tbx(i,c)==-1
        c=c-1;
    end
    seam_col(i)=c;
end

Ix=I(:,[1:seam_col-1 seam_col+1:end],:);

end