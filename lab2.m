%load housing Data
housing = load('housing.data');
%coloumn 8 only
x =housing(:,8);
%target values
t =housing(:,14);
%learning rate
alpha = 0.1;
%iterations
givenIterations = 100;
w = [0,0];
%Array of Errors
errors = zeros(1,givenIterations);
for i = 1:givenIterations
   m=@(x) lin_hyp(w,x);
   w=gradeintDecent(alpha,m,x,t,w);
   errors(i) = rms(m,x,t);  
end
hold on
title('Plot for Mean Square Error RXD65410')
plot(errors)
hold off
w
errors(i)