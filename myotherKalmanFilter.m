
% Create observation data

N = 500;
w = randn(1,N);
Apoly = [1 -1.2 0.9];
Bpoly = 1;
z = filter(Bpoly, Apoly, w);

% I will only use z as the observations below

% Model
A = eye(2);
B = zeros(2,2);
sigma2_1 = 0.000001;
sigma2_2 = 1;
R = sigma2_1 * eye(2);
Q = sigma2_2;
mu0 = [0 
    0];
Sigma0 = eye(2);

%Kalman Filter

muhistory = [];

% t = 1
C = [0 0];

mubar = A*mu0;
Sigmabar = A*Sigma0*A' + R;
K = Sigmabar*C'*inv(C*Sigmabar*C' + Q);
mu = mubar + K*(z(1) - C*mubar);
Sigma = ( eye(2) - K*C)*Sigmabar;

muhistory = [muhistory mu];

% t = 2

C = [-z(1) 0];

mubar = A*mu;
Sigmabar = A*Sigma*A' + R;
K = Sigmabar*C'*inv(C*Sigmabar*C' + Q);
mu = mubar + K*(z(2) - C*mubar);
Sigma = ( eye(2) - K*C)*Sigmabar;

muhistory = [muhistory mu];


% t = 3 to N

for t=3:N
    [t min(eig(Sigma)) mu']
    C = [-z(t-1) -z(t-2)];
    mubar = A*mu;
    Sigmabar = A*Sigma*A' + R;
    K = Sigmabar*C'*inv(C*Sigmabar*C' + Q);
    mu = mubar + K*(z(t) - C*mubar);
    Sigma = ( eye(2) - K*C )*Sigmabar;
    
    muhistory = [muhistory mu];

end

plot(muhistory'), grid


    
