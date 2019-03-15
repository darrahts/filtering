%Simulation

xinit = randn(2,1);

A = [0.1 0.3
     0 0.25];
B = [1 0
     0 2];
  
C = [2 -1];

U = [[ ones(1,500)  zeros(1,500)]
     [ zeros(1,500)  ones(1,500)] ];
 
Eps = randn(2,1000) * 0.1;;
R = eye(2)*.01;

Del = randn(1,1000)*.1;
Q = .01;

X = [];
Z = [];

xtminus1 = xinit;

for t = 1:1000
   X = [X xtminus1];
   ut = U(:,t);
   epsilont = Eps(:,t);
   xt = A*xtminus1 + B*ut + epsilont;
   deltat = Del(t);
   zt = C*xt + deltat;
   Z = [Z zt];
   xtminus1 = xt;   
end


 