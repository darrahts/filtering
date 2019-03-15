function xmoved = myPFmotion(X, rho, deltatheta, sigmatrans, sigmarot)

[nrows, ncols]=size(X);
xmoved = X;

for i=1:ncols
    
xmoved(1,i) = X(1,i) + rho*cos(X(3,i) + deltatheta) + randn(1)*sigmatrans;
xmoved(2,i) = X(2,i) + rho*sin(X(3,i) + deltatheta) + randn(1)*sigmatrans;
xmoved(3,i) = X(3,i) + deltatheta + randn(1)*sigmarot;

end


