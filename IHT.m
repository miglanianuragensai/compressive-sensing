function xhat = IHT(A,y,s)
maxIter = 1000;
eps = 0.01;
n = size(A,2);
xhat = zeros(n,1);
for i = 1:maxIter
    xhat = Hs(xhat + A'*(y-A*xhat),s);
    if norm(y-A*xhat)<eps
        break;
    end
end