M = 10000;
M1 = round(0.75*M);
M2 = M - M1;
X1 = [30*rand(1,M1)
      10*rand(1,M1)];
X2 = [10*rand(1,M2)+10
      10*rand(1,M2)+10];
X = [X1 X2];
X = [X
    (2*rand(1,M)-1)*pi];
