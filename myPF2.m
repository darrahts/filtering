figure(1)
myPFmap
hold on
myPFinitdist
plot(X(1,:), X(2,:), '.')

x0 = 25;
y0=9;
theta0 = pi/2;
z = myPFsensorfunction(x0, y0, theta0);

figure(2)

myPFweightfunction

X = myPFresample(X, w);

rho = 5;
deltatheta = pi/2;
sigmatrans = 0.01;
sigmarot = 0.01;

X = myPFmotion(X, rho, deltatheta, sigmatrans, sigmarot);
x1 = myPFmotion([x0 y0 theta0]', rho, deltatheta, 0, 0);
z = myPFsensorfunction(x1(1), x1(2), x1(3) );

figure(3)

myPFweightfunction

X = myPFresample(X, w);

rho = 5;
deltatheta = 0;
sigmatrans = 0.01;
sigmarot = 0.01;

X = myPFmotion(X, rho, deltatheta, sigmatrans, sigmarot);
x2 = myPFmotion([x1(1) x1(2) x1(3)]', rho, deltatheta, 0, 0);
z = myPFsensorfunction(x2(1), x2(2), x2(3) );

figure(4)

myPFweightfunction

X = myPFresample(X, w);

rho = 5;
deltatheta = 0;
sigmatrans = 0.01;
sigmarot = 0.01;

X = myPFmotion(X, rho, deltatheta, sigmatrans, sigmarot);
x3 = myPFmotion([x2(1) x2(2) x2(3)]', rho, deltatheta, 0, 0);
z = myPFsensorfunction(x3(1), x3(2), x3(3) );

figure(5)

myPFweightfunction

X = myPFresample(X, w);

rho = 5;
deltatheta = 0;
sigmatrans = 0.01;
sigmarot = 0.01;

X = myPFmotion(X, rho, deltatheta, sigmatrans, sigmarot);
x4 = myPFmotion([x3(1) x3(2) x3(3)]', rho, deltatheta, 0, 0);
z = myPFsensorfunction(x4(1), x4(2), x4(3) );

figure(6)

myPFweightfunction