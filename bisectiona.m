clear all; close all ; 

f = @(x) 1 - ((x - 3) ^ 2) - sin(x); 

figure(1);
ezplot(f, [0, 10]); grid on; 

leftBound = 2; 
rightBound = 3; 
iterations = 1;
max_iterations = 100;
tolerance = 10 ^ (-6);
midpoint = (leftBound + rightBound)/2;

figure(2);
plot(iterations,midpoint,'k*'); hold on;

tic
while abs(f(midpoint)) >= tolerance && iterations <= max_iterations
if f(leftBound) * f(midpoint) > 0
 leftBound = midpoint;
elseif f(leftBound) * f(midpoint) <= 0
    rightBound = midpoint;
end
midpoint = (leftBound + rightBound)/2;
iterations = iterations + 1;
plot(iterations, midpoint,'k*'); hold on;
end
toc

figure(2); grid on;
title('Convergence of the Bisection method');
xlabel('iteration number');
ylabel('root estimate');
root = midpoint;
totalIterations = iterations;

disp(f(root));
disp(totalIterations);





