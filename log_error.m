function ret = log_error( y,x,t )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%-y*log(hyp(x)) – (1-y)log(1-hyp(x))
%t = [0,0,0,1,0,1,0,1,1,1,1,1]
%x = [22000, 28000, 30000, 31000, 36000, 39000, 40000, 41000, 41100, 44000, 49000,52000]

sum=0;
for i = 1 : size(x, 1)
    sum = sum - t(i)*log(y(x(i,:)))-(1-t(i))*log(1-y(x(i,:)));
end

ret = sum/size(x,1);
end