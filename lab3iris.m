e=2.7182818284590452;
iris = load('iris.data');
iris = iris(randperm(size(iris,1)),:);

x=iris([1:100],[1:4]);

%% test and training set...
trainingset = iris(1:100, :);
testset = iris(101:150,:);
%% target values for both training and test sets..
train_target1 = zeros(1,size(trainingset,1));
train_target2 = zeros(1,size(trainingset,1));
train_target3 = zeros(1,size(trainingset,1));

test_target1 = zeros(1,size(testset,1));
test_target2 = zeros(1,size(testset,1));
test_target3 = zeros(1,size(testset,1));

for kh = 1:size(trainingset,1)
    if(trainingset(kh,5)==1) 
        train_target1(kh)=1;
    end
    
    if(trainingset(kh,5)==2) 
        train_target2(kh)=1;
    end
    
    if(trainingset(kh,5)==3) 
        train_target3(kh)=1;
    end
end
for kg = 1:size(testset,1)
    if(testset(kg,5)==1) 
        test_target1(kg)=1;
    end
    
    if(testset(kg,5)==2) 
        test_target2(kg)=1;
    end
    
    if(testset(kg,5)==3) 
        test_target3(kg)=1;
    end
end

%initialize w to random numbers here... let it be 0,0
w=[0,0,0,0,0];
%learning rate
alpha = 0.1;
%iterations
givenIterations = 100;
errors = zeros(1,givenIterations);
logistic = @(x) 1/(1+e^x);

%% First classifier
for i = 1:givenIterations
   m=@(x) logistic(lin_hyp(w,x));
   w=gradeintDecent(alpha,m,x,train_target1,w);
   errors(i) = log_error(m,x,train_target1);
end
fprintf('\nClassifier 1:\nFinal error(after 100 iterations) is %f.\nWeights are [%f,%f,%f,%f,%f]',errors(i),w(1),w(2),w(3),w(4),w(5));
%%Lets test the accuracy of this classifier using the test set.
correct=0;
for kg = 1:size(testset,1)
    %% Lets predict the value of each row in test set. Use the w values which we got in above step. 
    myPredict = logistic(lin_hyp(w,testset(kg,[1:4])));
    %% this is the actual value.
    actual_val = test_target1(kg);
    %% lets compare our prediction vs actual value. Am taking 0.7 as threshold.
    %% If my prediction is greater than 0.7, 
    %% it means my hypothesis is predicting that it is more likely that given row belongs to Class 1.
    if((myPredict<0.7 && actual_val==0) || (myPredict>0.7 && actual_val==1))
        correct = correct+1;
    end
end
fprintf('\nTest Results(accuracy) : %f',(correct/50)*100)

%% second classifier
w=[0,0,0,0,0];
errors2 = zeros(1,givenIterations);
for i = 1:givenIterations
   m=@(x) logistic(lin_hyp(w,x));
   w=gradeintDecent(alpha,m,x,train_target2,w);
   errors2(i) = log_error(m,x,train_target2);
end
fprintf('\n\nClassifier 2:\nFinal error(after 100 iterations) is %f.\nWeights are [%f,%f,%f,%f,%f]',errors2(i),w(1),w(2),w(3),w(4),w(5));
correct=0;
for kg = 1:size(testset,1)
    myPredict = logistic(lin_hyp(w,testset(kg,[1:4])));
    actual_val = test_target2(kg);
    if((myPredict<0.7 && actual_val==0) || (myPredict>0.7 && actual_val==1))
        correct = correct+1;
    end
end
fprintf('\nTest Results(accuracy): %f',(correct/50)*100)


%% third classifier
w=[0,0,0,0,0];
errors3 = zeros(1,givenIterations);
for i = 1:givenIterations
   m=@(x) logistic(lin_hyp(w,x));
   w=gradeintDecent(alpha,m,x,train_target3,w);
   errors3(i) = log_error(m,x,train_target3);
end
fprintf('\n\nClassifier 3:\nFinal error(after 100 iterations) is %f.\nWeights are [%f,%f,%f,%f,%f]',errors3(i),w(1),w(2),w(3),w(4),w(5));

correct=0;
for kg = 1:size(testset,1)
    myPredict = logistic(lin_hyp(w,testset(kg,[1:4])));
    actual_val = test_target3(kg);
    if((myPredict<0.7 && actual_val==0) || (myPredict>0.7 && actual_val==1))
        correct = correct+1;
    end
end
fprintf('\nTest Results(accuracy): %f\n\n',(correct/50)*100)
