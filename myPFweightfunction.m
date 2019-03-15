[nrows, ncols]=size(X);
M = ncols;
weight = zeros(1, M);
sigma = 1;
sigma2 = sigma^2;

for i=1:M
    tmp = X(:,i);
    zhat = myPFsensorfunction(tmp(1), tmp(2), tmp(3));
    w(i) = exp( -0.5*(norm( zhat - z)^2)/ sigma2  ) ;
    if (tmp(1) <= 0)|(tmp(2)<=0)|(tmp(1)>=30)|(tmp(2)>=20)
        w(i) = 0;
    end
    if (tmp(1) <=10)&(tmp(2)>=10)
        w(i) = 0;
    end
    if (tmp(1) >=20)&(tmp(2)>=10)
        w(i) = 0;
    end

end

w = w / sum(w);

wsort = sort(w);

thresh = wsort( round(0.9*M) );

%thresh = 0.6;
 
myPFmap
hold on
for i=1:M
    if w(i) >= thresh
        plot(X(1,i), X(2,i), '.')
    end
end

hold off
