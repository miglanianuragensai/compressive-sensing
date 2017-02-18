n = 512;
m = 128;
k = 32;
s = 15;
x = randn(n,1);
A = normc(randn(m,n));
y = A*x;

mse = [];
for m = 128:32:512
    A = normc(randn(m,n));
    r = spg_bp(A, A*x);
    mse = [mse, norm(r-x)];
end

figure(1)
plot(128:32:512, mse),
xlabel('number of rows'),ylabel('Mean square error'),title('Ex 1: MSE');
saveas(1,'comp1.png')

% Exercise 2
D = dctmtx(size(A,1));
c = sprand(n,1,0.1);
x = D'*c;
mse = [];
for m = 128:32:512
    A = normc(randn(m,n));
    r = spg_bp(A, A*x);
    mse = [mse, norm(r-x)];
end
figure(2)
plot(128:32:512, mse),
xlabel('number of rows'),ylabel('Mean square error'),title('Ex 2: MSE');
saveas(2,'comp2.png');

% Exercise 3
mse = [];
sigma = 0.1;
for m = 128:32:480
    A = 0.9 * normc(randn(m,n));
    y = A*x + sigma*randn(m,1);
    r = spg_bp(A, A*x, spgSetParms('iterations',10000));
    mse = [mse, norm(r-x)/norm(x)];
end
figure(3)
plot(128:32:480, mse),
xlabel('number of rows'),ylabel('Mean square error'),title('Ex 3: MSE');
saveas(3,'comp3.png');
% Exercise 4
mse = [];
for m = 128:32:512
    A = 0.9*normc(randn(m,n))/norm(A);
    r = IHT(A, A*x, s);
    mse = [mse, norm(r-x)/norm(x)];
end
figure(4)
plot(128:32:512, mse),
xlabel('number of rows'),ylabel('Mean square error'),title('Ex 4: MSE');
saveas(4,'comp4.png');
% Exercise 5
mse = [];
for m = 128:32:512
    A = 0.9*normc(randn(m,n))/norm(A);
    r = OMP(A, A*x, s);
    mse = [mse, norm(r-x)/norm(x)];
end
figure(5)
plot(128:32:512, mse),
xlabel('number of rows'),ylabel('Mean square error'),title('Ex 5: MSE');
saveas(5,'comp5.png')
% Exercise 6
nr = 500; nc = 30; % nc vectors of dim nr
V = randn(nr,nc);
dv = distPairs(V);
relErr = [];
aveErr = [];
for m = 5:5:30;
    A = randn(m,nr);
    dw = distPairs(A*V);
    relErr = [relErr abs(dv-dw)./dv];
    aveErr = [aveErr sum(sum(relErr))/(nc^2-nc)];
end
figure(6)
plot(5:5:30, aveErr),
xlabel('number of measurements'),ylabel('Average Relative Error'),title('Random Projections of 500-vectors');
saveas(6,'comp6-2.png')
