function [Z] = zca2(x)
epsilon = 1e-4;
% You should be able to use the code from your PCA/ZCA exercise
% Retain all of the components from the ZCA transform (i.e. do not do
% dimensionality reduction)

% x is the input patch data of size
% z is the ZCA transformed data. The dimenison of z = x.
x = bsxfun(@minus,x,mean(x,1));
sigma = 1/size(x,2) * x * x';
[U,S,V] = svd(sigma);
xRot = U' * x;
Z = U * diag(1./(sqrt(diag(S))+epsilon)) * xRot;
end
%%% YOUR CODE HERE %%%
