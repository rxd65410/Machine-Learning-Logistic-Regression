e=2.7182818284590452;
t = [0,0,0,1,0,1,0,1,1,1,1,1];
x = [22000, 28000, 30000, 31000, 36000, 39000, 40000, 41000, 41100, 44000, 49000,52000];
x=transpose(x);

% %Step 1 in LAB3
 k =0.00025;
 x0=38000;
 logistic = @(x) 1/(1+e^(-k*(x-x0)));
 domain = 0:60000;
 
 hold on;
 plot(domain,arrayfun(logistic, domain),'-r');
 scatter(x,t);
 
 %Step 2 in LAB3
 logistic2 = @(x) 1/(1+e^x);
 %w=[x0*k,-k] to get same as step1... using y=mx+c
 w2=[36500*0.00025,-0.00025];
 m2=@(x) logistic2(lin_hyp(w2,x));
 plot(domain,arrayfun(m2,domain),'-y');
 
 %Step 3 in LAB3
 step3_error = log_error(m2,x,t)
 hold off

%Step 4 in LAB4
%initialize w to random numbers here... let it be 0,0
w=[9,0];
%learning rate
alpha = 0.000000001;
%iterations
givenIterations = 1000;
errors = zeros(1,givenIterations);
logistic = @(x) 1/(1+e^x);
for i = 1:givenIterations
   m=@(x) logistic(lin_hyp(w,x));
   w=gradeintDecent(alpha,m,x,t,w);
   errors(i) = log_error(m,x,t);
end
final_w = w
final_error = errors(i)
% hold on
% title('Plot for Mean Square Error RXD65410')
% plot(errors)
% hold off




logistic = @(x) 1/(1+e^x);
%w=[38000*0.00025,-0.00025];
%w=[x0*k,-k]

m=@(x) logistic(lin_hyp(w,x));
hold on
plot(domain,arrayfun(m,domain),'-g');
hold off

