
% load mat files
% load digits.mat

% add paths
addpath('utils');

%% TRAINING
trIndexRange = 1:60000;
trDataset = getDataset(trainImages, trainLabels, trIndexRange);

% construct eigen space from training dataset
eigenSpace = hw1FindEigendigits(trDataset.vectors);

% plot mean face and eigen faces
meanFace = vector2face(eigenSpace.mean,28,28);
figure;
imshow(meanFace);
title('mean face');
eigenFaces = vector2face(eigenSpace.eigenVectors,28,28);
figure;
imshow(256*eigenFaces(:,:,1));
title('eigen face');

%% TESTING
% choose a subset of images (w,h,1,k)
teIndexRange = 1:10000;
teDataset = getDataset(testImages, testLabels, teIndexRange);

% project train and test dataset into eigen space
n = 32;         % use top n eigen vectors
trDataset.newVectors = getVecOnEigenSpace(eigenSpace,n,trDataset.vectors);
teDataset.newVectors = getVecOnEigenSpace(eigenSpace,n,teDataset.vectors);

% use knn
% k = 10;         % k nearest neighbors
% this method is discarded in future releases, use fitcknn instead.
% predictLabels = knnclassify(teDataset.newVectors', trDataset.newVectors', trDataset.labels, k);
% sprintf('overall accuracy: %f',sum(predictLabels==teDataset.labels')/length(teIndexRange))
k = 10;         % k nearest neighbors
knn = fitcknn(trDataset.newVectors',trDataset.labels,'NumNeighbors', k);
predictLabels = knn.predict(teDataset.newVectors');
sprintf('overall accuracy: %f',sum(predictLabels==teDataset.labels')/length(teIndexRange))

