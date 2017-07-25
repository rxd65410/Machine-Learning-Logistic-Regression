function ret = lin_hyp( w,x )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
ws = length(w);
xs = length(x);
sum = w(1);
for n = 2 : ws
    sum = sum+(w(n)*x(n-1));
ret = sum;
end

