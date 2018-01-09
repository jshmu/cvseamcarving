% File Name: cumMinEngHor.m
% Author: Jane Shmushkis
% Date: 10-28-17

function [My, Tby] = cumMinEngHor(e)
% Input:
%   e is the energy map

% Output:
%   My is the cumulative minimum energy map along horizontal direction.
%   Tby is the backtrack table along horizontal direction.

% Write Your Code Here
My=e;
Tby=zeros(size(e));
for j=2:size(e,2)
    for i=1:size(e,1)
        if i+1<=size(e,1) & i-1>=1
            min_val=min([My(i-1,j-1) My(i,j-1) My(i+1,j-1)]);
            My(i,j)=My(i,j)+ min_val;
            if My(i-1,j-1)==min([My(i-1,j-1) My(i,j-1) My(i+1,j-1)]);
                Tby(i,j)=-1;
            elseif My(i+1,j-1)==min([My(i-1,j-1) My(i,j-1) My(i+1,j-1)]);
                Tby(i,j)=+1;
            end
        elseif i+1>size(e,1)
            min_val=min([My(i-1,j-1) My(i,j-1)]);
            My(i,j)=My(i,j)+ min_val;
            if My(i-1,j-1)==min([My(i-1,j-1) My(i,j-1)]);
                Tby(i,j)=-1;
            end
        else
            min_val=min([My(i,j-1) My(i+1,j-1)]);
            My(i,j)=My(i,j)+ min_val;
            if My(i+1,j-1)==min([My(i,j-1) My(i+1,j-1)]);
                Tby(i,j)=+1;
            end
        end

    end
end
% figure; imagesc(My);
% figure; imagesc(Tby);

end