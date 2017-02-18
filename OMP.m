function [x,S,err] = OMP(A,y,nit)

% performs Orthogonal Matching Pursuit on the sparse problem y=Ax
% inputs: measurement matrix A, observation y, number of iterations
% outputs: sparse estimate of x, support S, data fidelity err


% initialization
[nr,nc]=size(A);
if length(y)~= nr
    error('Input sizes do not match');
end
x = zeros(nc,1);
r = y;
S = [];

for k=1:nit
    % atom selection
    correlations = A'*r;
    [~,selectedIndex] = max(abs(correlations));
    S = [S,selectedIndex];
    % update residual
    Ak = A(:,S);
    r = y - Ak*pinv(Ak)*y;
    err(k) = sum(abs(r).^2);
end

% build estimate
x(S) = pinv(Ak)*y; 

