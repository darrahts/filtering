function [X] = myPFmotion(X, rho, deltatheta, sigmatrans, sigmarot)

X = X';
sizex = size(X,1);
sizey = size(X,2);

for(i=1:sizex)
    theta1 = X(i,1);
    xt1 = X(i,2);
    yt1 = X(i,3);
    
    thetat = theta1 + deltatheta + sigmarot;
    xt = xt1 + rho*cos(theta1 + deltatheta) + sigmatrans;
    yt = yt1 + rho*sin(theta1 + deltatheta) + sigmatrans;
    
    Xnew(i,1) = xt;
    Xnew(i,2) = yt;
    Xnew(i,3) = thetat;
end

X = Xnew';

end

