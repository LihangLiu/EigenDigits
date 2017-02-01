function eigenSpace = hw1FindEigendigits( A )
% A: (x,k), x is feature dimension,
% m: (x,1), mean of A
% V: (x,k), k eigenvectors of A-m, sorted and normalized,
% eigenSpace: a struct
% assume k<x such that a k*k covariance matrix should be calculated first
%   for speed up.

    [x,k] = size(A);
    % substract mean face
    m = mean(A,2);
    A_m = A - repmat(m,1,k);
    
    if x>k
        % k*k covariance matrix
        A_T_A = A_m'*A_m;
        [V1 D] = eig(A_T_A);


        % convert to x*x
        V = A*V1;
    else
        A_A_T = A_m*A_m';
        [V D] = eig(A_A_T);
    end
    
    % sort (revert here)
    V = V(:, end:-1:1);
    D = flip(diag(D));
    % normalize
    for i=1:size(V,2)
        V(:,i) = V(:,i)/norm(V(:,i));
    end
    
    eigenSpace = struct('mean', m, 'eigenVectors', V, 'eigenValues', D);
end

