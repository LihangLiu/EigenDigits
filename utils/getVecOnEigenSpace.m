function [ newVecs ] = getVecOnEigenSpace(eigenSpace, n, vecs )
% eigenVecs: (x,k), k eigen vectors
% meanVec: (x,1), mean vector
% n: top n vectors are used
% vecs: (x,m), the original vector
% newVecs: (n,m), projected vector on the eigen space

    [x,k] = size(eigenSpace.eigenVectors);
    if n>k
        springf('dimensions dont match');
    end
    
    [x, m] = size(vecs);
    topNEigenVec = eigenSpace.eigenVectors(:,1:n);
    newVecs = vecs - repmat(eigenSpace.mean,1,m);
    newVecs = topNEigenVec'*newVecs;


end

