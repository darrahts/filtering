%KF

%Phi = [0.99 0
%    0 0.96];
%H   = eye(2);
%sigma2 = 0.0001;
R = sigma2 * eye(2);
Q = R;

xinit = [0 
    0];

Pinit = eye(2);
xhatprimek = xinit;
Pprimek = Pinit;

Xhatprimek = [];
Xhatk = [];

for k=1:1000
   K =  Pprimek*H'*inv(H*Pprimek*H'+R);
   zk = Zk(:,k);
   xhatk = xhatprimek + K*(zk - H*xhatprimek);
   Pk = (eye(2) - K*H)*Pprimek;
   Xhatprimek = [Xhatprimek xhatprimek];
   Xhatk = [Xhatk xhatk];
   xhatprimek = Phi*xhatk;
   Pprimek = Phi*Pk*Phi' + Q;
end

