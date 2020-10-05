clear all; close all ; % closes and clears stuff

f = @(x) 1 - ((x - 3) ^ 2) - sin(x); % function of analysis:1 - ((x - 3) ^ 2) - sin(x)

figure(1);
ezplot(f, [2, 3]); grid on; % plots section of graph where I know an intercept is, between x=2 and x=3

tolerance = 10^(-3); % The point where it is close enough to zero to stop
iterations = 1;
max_iterations = 100;

% variables declared
x1 = 2;
y1 = f(x1);
x2 = 3; 
y2 = f(x2);
z = x2 - (y2 * ((x2 - x1)/(y2 - y1)));
fz = f(z);

figure(2);% prepares to graph while loop output
plot(iterations,z,'k*'); hold on;

tic
while abs(fz) >= tolerance && iterations <= max_iterations
    if sign(fz) == sign(y1)
      x1 = z;
    elseif sign(fz) == sign(y2)
      x2 = z;
    end
    % the following must be included so changes can be made
    y1 = f(x1);
    y2 = f(x2);
   z = x2 - (y2 * ((x2 - x1)/(y2 - y1)));
   fz = f(z);
   % iteration counter for second while loop constraint
   iterations = iterations + 1;
   plot(iterations,z,'k*'); hold on;
end
 toc   
%tic toc shows time elapsed

figure(2); grid on; % making a graph
title('Convergence of the False Position method');
xlabel('iteration number');
ylabel('root estimate');

root = z; %makes it easier to display results
totalIterations = iterations;

disp(f(root)); % displays results
disp(totalIterations);



    