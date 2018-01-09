% File Name: carv.m
% Author:
% Date:

function [Ic, T] = carv(I, nr, nc)
% Input:
%   I is the image being resized
%   [nr, nc] is the numbers of rows and columns to remove.
% 
% Output: 
% Ic is the resized image
% T is the transport map

% Write Your Code Here
h= figure(2); clf;
whitebg(h,[0,0,0]);

do_trig=0;

T=zeros(nr+1,nc+1);
IcAll=cell(nr+1,nc+1);
IcAll{1,1}=I;
Path=zeros(nr+1,nc+1);
%save coordinates for path

%VIDEO STUFF
if do_trig
    fname = 'Project3a.avi';
else
    fname = 'Project3a.avi';
end

try
    % VideoWriter based video creation
    h_avi = VideoWriter(fname, 'Uncompressed AVI');
    h_avi.FrameRate =7;
    h_avi.open();
catch
    % Fallback deprecated avifile based video creation
    h_avi = avifile(fname,'fps',7);
end

for i=1:nr+1
    for j=1:nc+1
        if j==1 & i>1
            e = genEngMap(IcAll{i-1,j});
            [My, Tby] = cumMinEngHor(e);
            [Iy, E] = rmHorSeam(IcAll{i-1,j}, My, Tby);
            T(i,j)=T(i-1,j)+E;
            IcAll{i,j}=Iy;
            Path(i,j)=1;
            
        elseif i>1
            e = genEngMap(IcAll{i-1,j});
            [My, Tby] = cumMinEngHor(e);
            [Iy, Ey] = rmHorSeam(IcAll{i-1,j}, My, Tby);
            
            e = genEngMap(IcAll{i,j-1});
            [Mx, Tbx] = cumMinEngVer(e);
            [Ix, Ex] = rmVerSeam(IcAll{i,j-1}, Mx, Tbx);

            if (T(i,j-1)+Ex)>(Ey+T(i-1,j))
                T(i,j)=T(i-1,j)+Ey;
                IcAll{i,j}=Iy;
                Path(i,j)=1; %came from top image
            else
                T(i,j)=T(i,j-1)+Ex;
                IcAll{i,j}=Ix;
                Path(i,j)=-1; %came from left image
            end
            
        elseif i==1
            if j<=nc
                e = genEngMap(IcAll{i,j});
                [Mx, Tbx] = cumMinEngVer(e);
                [Ix, E] = rmVerSeam(IcAll{i,j}, Mx, Tbx);
                T(i,j+1)=T(i,j)+E;
                IcAll{i,j+1}=Ix;
                Path(i,j+1)=-1;
            end
        end
    end
end

r=nr+1;
c=nc+1;
a=cell(nr*2+1,1);
for k=nr*2+1:-1:2
    p=Path(r,c);
    a{k}=IcAll{r,c};
    if p == 1
        r=r-1;
    elseif p==-1
        c=c-1;
    end
end
a{1}=IcAll{r,c};

%Saving frames in order of seam removal
for f=1:length(a)
    imagesc(a{f});
    try
        % VideoWriter based video creation
        h_avi.writeVideo(getframe(gcf));
    catch
        % Fallback deprecated avifile based video creation
        h_avi = addframe(h_avi, getframe(gcf));
    end
end


try
    % VideoWriter based video creation
    h_avi.close();
catch
    % Fallback deprecated avifile based video creation
    h_avi = close(h_avi);
end
clear h_avi;

Ic=IcAll{end,end}; %final image

end