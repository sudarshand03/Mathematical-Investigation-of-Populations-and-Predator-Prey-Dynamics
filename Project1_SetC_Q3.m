%%Problem Set C Question 3

% Defining all needed parameter values
alpha = 1.5;
beta = 1.1;
gamma = 2.5;
delta = 1.4;
kappa = 0.5;

% Defining the system of equations
f = @(t, x)[-alpha*x(1) + beta*x(1)*x(2);
 gamma*(1-kappa*x(2))*x(2) - delta*x(1)*x(2)];

[t1, sol1] = ode45(f, [0,30], [5,1]);
[t2, sol2] = ode45(f, [0,30], [1,5]);

% Plotted Solution for Inital Condition (5,1)
figure;
plot(t1, sol1(:,1), 'b-', t1, sol1(:,2), 'r-', 'LineWidth', 2);
grid on;

xlabel('Time in Years');
ylabel('Population in Dozens');
title('Solution for initial condition (5,1)');
legend('Mountain Lion', 'Deer');

% Plotted Solution for Inital Condition (1,5)
figure;
plot(t2, sol2(:,1), 'b-', t2, sol2(:,2), 'r-', 'LineWidth', 2);
grid on;
xlabel('Time in Years');
ylabel('Population in Dozens');
title('Solution for initial condition (1,5)');
legend('Mountain Lion', 'Deer');
