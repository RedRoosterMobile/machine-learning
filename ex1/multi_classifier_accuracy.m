%function accuracy=binary_classifier_accuracy(theta, X,y)
function accuracy=multi_classifier_accuracy(theta, X,y)
  % [~,labels] = max(theta'*X, [], 1);
  %y_guess = exp(theta(:,k)' * X) ./ sum( exp(theta' * X), 1)
 % A= theta'*X;
  %testData = A(:,1:10)
  %testLabel = max(A(:,1:10),[],1)
  %testCorrect = sum(y == labels)
  [maxI,labels] = max(theta'*X, [], 1);
  correct=sum(y == labels);
  accuracy = correct / length(y);
