function [AC, singvals] =compress(A, r)
    %Function for compressing image matrix A
    [U, S, V] = svd(A);
    singvals = diag(S);   
    AC = U(:,1:r)*S(1:r,1:r)*V(:,1:r)';
end