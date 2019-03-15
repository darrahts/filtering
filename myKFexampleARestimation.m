% Create simulation data
a1 = .75;
a2 = -.125;
N=10000;
w = randn(N,1);
A = [1 -a1 -a2];
z = filter(1, A, w);


% Kalman Filter

A = eye(2);
S0 = 1000 * eye(2);
mu0 = zeros(2,1);
R = .000000000 * eye(2);
Q = 1;

mu = mu0;
S = S0;
mupast = [];

for t = 3:length(z)
    mubar = A * mu;
    Sbar = A*S*A' + R;
    C = [z(t-1) z(t-2)];
    K = Sbar*C'*inv( C*Sbar*C' + Q);
    mu = mubar + K*(z(t) - C*mubar);
    S = (eye(2) - K*C)*Sbar;
    
    mupast = [mupast mu];
end
    