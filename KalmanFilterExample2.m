%KF estimate AR paramters

Phi = [1 0
    0 1];

sigma2 = 1.;
R = sigma2 * eye(1);
Q = eye(2) * 0.0;

xinit = [1 
    -1];

Pinit = eye(2);
xhatprimek = xinit;
Pprimek = Pinit;

Xhatprimek = [];
Xhatk = [];

for k=3:length(y)
   H = [y(k-1) y(k-2)];
   K =  Pprimek*H'*inv(H*Pprimek*H'+R);
   zk = y(k);
   xhatk = xhatprimek + K*(zk - H*xhatprimek);
   Pk = (eye(2) - K*H)*Pprimek;
   Xhatprimek = [Xhatprimek xhatprimek];
   Xhatk = [Xhatk xhatk];
   xhatprimek = Phi*xhatk;
   Pprimek = Phi*Pk*Phi' + Q;
end

