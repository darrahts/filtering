%Simulate AR signal
w = randn(1,1000);
y = filter(1, [1 -1 0.8], w);
Zk = y;

%KF estimate AR paramters

Phi = [1 0
    0 1];
%H   = eye(2);
sigma2 = 1;
R = sigma2 * eye(1);
Q = 0*eye(1);

xinit = [0 
    0];

Pinit = eye(2);
xhatprimek = xinit;
Pprimek = Pinit;

Xhatprimek = [];
Xhatk = [];

for k=3:1000
   H = [y(k-1) y(k-2)];
   K =  Pprimek*H'*inv(H*Pprimek*H'+R);
   zk = Zk(:,k);
   xhatk = xhatprimek + K*(zk - H*xhatprimek);
   Pk = (eye(2) - K*H)*Pprimek;
   Xhatprimek = [Xhatprimek xhatprimek];
   Xhatk = [Xhatk xhatk];
   xhatprimek = Phi*xhatk;
   Pprimek = Phi*Pk*Phi' + Q;
end

