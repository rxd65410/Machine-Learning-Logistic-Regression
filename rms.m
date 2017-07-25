function ret = rms( y, x, t )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
ret = 0;

for i = 1 : size(x, 1)
    ret = ret + (y(x(i,:))-t(i))^2;  
end
ret = sqrt(ret/size(x,1));
end
