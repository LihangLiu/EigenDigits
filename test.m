
indexRange = 1:100;
subimages = double(trainImages(:,:,:,indexRange));
sublabels = trainLabels(indexRange);

% extract images from the same class
% class = 4;
% subimages_4 = subimages(:,:,:,sublabels==class);

eigenImages = subimages;

% convert images to (x,k) matrixes and find eigenvectors
faces = squeeze(eigenImages);
vectors = face2vector(faces);
[m, eigenVectors] = hw1FindEigendigits(vectors);

% plot mean face and eigen faces
meanFace = vector2face(m,28,28);
figure;
title('mean face');
imshow(meanFace);
eigenFaces = vector2face(eigenVectors,28,28);
figure;
title('eigen face');
imshow(256*eigenFaces(:,:,1));