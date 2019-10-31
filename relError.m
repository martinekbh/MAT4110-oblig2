function functionerror = relError(A, AK)
% regner ut den relative feilen mellom en bildematrise A og en
% approksimasjon AK av A.
A = double(A);
AK = double(AK);

% regner normen til A
x = 0;
[m,n] = size(A);
for i = 1:m
    for j = 1:n
        x = x + (A(i,j)^2);
    end
end
normA = sqrt(x);

% regner normen til M=A-AK
x = 0;
M = A-AK;
for i = 1:m
    for j = 1:n
        x = x + (M(i,j)^2);
    end
end
normM = sqrt(x);

% regner ut den relative feilen
functionerror = normM/normA;