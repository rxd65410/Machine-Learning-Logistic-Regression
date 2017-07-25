function ret = gradeintDecent(alpha, y, x, t, w)
  grad = zeros(1,size(x,2)+1);
  for i=1:size(x,1)      
    grad(1) = grad(1) + t(i) - y(x(i,:));
    for j=1:size(x,2)
      grad(j+1) = grad(j+1) + x(i,j)*(t(i) - y(x(i,:)));
    end
  end
  grad = grad / size(x,1);
  
  ret = w - alpha * grad;
end