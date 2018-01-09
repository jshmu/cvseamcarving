% File Name: cumMinEngVer.m
% Author: Jane Shmushkis
% Date: 10-28-17

function [Mx, Tbx] = cumMinEngVer(e)
% Input:
%   e is the energy map. n x m

% Output:
%   Mx is the cumulative minimum energy map along vertical direction. n x m
%   Tbx is the backtrack table along vertical direction. n x m

% Write Your Code Here
Mx=e;
Tbx=zeros(size(e));
for i=2:size(e,1)
    for j=1:size(e,2)
        if j+1<=size(e,2) & j-1>=1
            a=Mx(i-1,j-1);
            b=Mx(i-1,j);
            c=Mx(i-1,j+1);
            Mx(i,j)=Mx(i,j)+ min([a b c]);
            if a==min([a b c]);
                Tbx(i,j)=-1;
            elseif c==min([a b c]);
                Tbx(i,j)=+1;
            end
        elseif j+1>size(e,2)
            a=Mx(i-1,j-1);
            b=Mx(i-1,j);
            Mx(i,j)=Mx(i,j)+ min([a b]);
            if a==min([a b c]);
                Tbx(i,j)=-1;
            end
        else
            b=Mx(i-1,j);
            c=Mx(i-1,j+1);
            Mx(i,j)=Mx(i,j)+ min([b c]);
            if c==min([b c]);
                Tbx(i,j)=+1;
            end
        end
    end
end
% figure; imagesc(Mx);
% figure; imagesc(Tbx);

end