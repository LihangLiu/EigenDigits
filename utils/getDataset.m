function [ dataset ] = getDataset( originalImages, originalLabels, indexRange )
% originalImages: (W,H,1,N)
% originalLabels: (1, N)
% images: (W,H,K)
% labels: (1,K)
% vectors: (W*H, K) or (X,K)

    % choose a subset of images
    images = double(originalImages(:,:,:,indexRange));
    labels = originalLabels(indexRange);
    % convert images to (x,k) matrixes
    images = squeeze(images);
    vectors = face2vector(images);
    dataset = struct('images',images, 'labels',labels,'vectors',vectors);
    

end

