% function mesh = getMesh(nc,np,h)
%
% Lindsey J. Heagy
% last modified: March 26, 2014

function mesh = getMesh(nc,np,h)
if nargin < 3
    h = 1;
end

if numel(h) < 2;
    if np > 0
        zp = logspace(log10(h),log10(3e5),np)';
        zp = h/zp(1)*zp;
        hp = diff(zp);
    else
        hp = [];
    end
    hc = ones(nc,1)*h;
    dz = [hc;hp];
else
    dz = h;
end

z  = [0; cumsum(dz)];
zc = z(1:end-1) + diff(z)/2;

mesh.dz  = dz;
mesh.z   = z;
mesh.zc  = zc;
mesh.nz  = numel(z);
mesh.nzc = numel(zc);

end