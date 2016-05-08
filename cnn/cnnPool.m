function pooledFeatures = cnnPool(poolDim, convolvedFeatures)
%cnnPool Pools the given convolved features
%
% Parameters:
%  poolDim - dimension of pooling region
%  convolvedFeatures - convolved features to pool (as given by cnnConvolve)
%                      convolvedFeatures(imageRow, imageCol, featureNum, imageNum)
%
% Returns:
%  pooledFeatures - matrix of pooled features in the form
%                   pooledFeatures(poolRow, poolCol, featureNum, imageNum)
%     

numImages = size(convolvedFeatures, 4);
numFilters = size(convolvedFeatures, 3);
convolvedDim = size(convolvedFeatures, 1);

pooledFeatures = zeros(convolvedDim / poolDim, ...
        convolvedDim / poolDim, numFilters, numImages);

% Instructions:
%   Now pool the convolved features in regions of poolDim x poolDim,
%   to obtain the 
%   (convolvedDim/poolDim) x (convolvedDim/poolDim) x numFeatures x numImages 
%   matrix pooledFeatures, such that
%   pooledFeatures(poolRow, poolCol, featureNum, imageNum) is the 
%   value of the featureNum feature for the imageNum image pooled over the
%   corresponding (poolRow, poolCol) pooling region. 
%   
%   Use mean pooling here.

%%% YOUR CODE HERE %%%
%pooledImage = zeros(convolvedDim / poolDim,convolvedDim / poolDim);
outputDim = convolvedDim / poolDim;
diffDim = convolvedDim-poolDim+1;
for i = 1: numFilters
    for j = 1: numImages
         %pooledImage(i,j) = mean(mean(convolvedFeatures((i-1)*poolDim+1 : i * poolDim, (j-1)*poolDim+1 : j * poolDim, numFilters, numImages)));
         convolvedImage =  convolvedFeatures(:, :, i, j);
         pooledImage = conv2(convolvedImage,ones(poolDim,poolDim),'valid');
         pooledImage = pooledImage(1:poolDim:diffDim,1:poolDim:diffDim);
         pooledFeatures(:, :, i, j) = pooledImage/(poolDim^2);
    end
end
end

