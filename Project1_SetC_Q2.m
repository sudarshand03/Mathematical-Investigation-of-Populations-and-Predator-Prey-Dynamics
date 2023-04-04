%% Project 1 Set C Question 2

close all;
clear all;

% Set the axis limits so that you plot the vector field over the
% intervals x1min < x1 < x1max, x2min < x2 < x2max
x1min = -1; x1max = 6; x2min = -1; x2max = 6;

% Step sizes for x1 and x2
x1step = 0.1; x2step = 0.1;

% Generate mesh for plotting
[x1, x2] = meshgrid(x1min:x1step:x1max, x2min:x2step:x2max);

% Defining all needed parameter values
alpha = 1.5;
beta = 1.1;
gamma = 2.5;
delta = 1.4;
kappa = 0.5;

% Defining the system of equations
f = @(t, x)[-alpha*x(1) + beta*x(1)*x(2);
 gamma*(1-kappa*x(2))*x(2) - delta*x(1)*x(2)];

% Normalizing vectors (to help plotting)
dx1 = -alpha.*x1 + beta.*x1.*x2;
dx2 = gamma.*(1 - kappa.*x2).*x2 - delta.*x1.*x2;
dx1_norm = dx1./sqrt(dx1.^2 + dx2.^2);
dx2_norm = dx2./sqrt(dx1.^2 + dx2.^2);

% Generating the vector field
figure;
quiver(x1, x2, dx1_norm, dx2_norm, 'AutoScaleFactor', 0.5, 'color', ...
    [0.5, 0.5,0.5], 'DisplayName','Vector Field');
hold on;

% Label for axes and title
xlabel('$x_1$ Predator System','Interpreter','latex')
ylabel('$x_2$ Prey System','Interpreter','latex')
title('Vector field of Logistic Predator-Prey system', ...
    'Interpreter','latex')

% Ploted nullclines and equilibrium solutions
domain_null = -1:.1:6;
vec_0 = zeros(size(domain_null));
v_null = vec_0 + (alpha/beta);
h_null = (gamma/delta)*(1-kappa*domain_null);

% v-nullclines
plot(vec_0, domain_null, 'red', 'LineWidth', 1.0, ...
    'DisplayName','V Nullcline 1');
plot(domain_null, v_null, 'red', 'LineWidth', 1.0, 'DisplayName', ...
    'V NullCline 2');

% h-nullclines
plot(domain_null, vec_0, 'black', 'LineWidth', 1.0, ...
    'DisplayName','H Nullcline 1');
plot(h_null, domain_null, 'black', 'LineWidth', 1.0, ...
    'DisplayName','H Nullcline 2');

% Equillibrium solutions
%x1_line = [0, 0, (gamma/delta)*(1-kappa* (alpha/beta))];
%x2_line = [0, 2, alpha/beta];

unstable_point_1=[0;0];
unstable_point_2=[0;2];

stable_point=[0.569244;1.36538];

p1 = plot(unstable_point_1(1),unstable_point_1(2),'o','Color','Green', ...
    'LineWidth',1,'DisplayName', 'Unstable Equilibrium');
p2=plot(unstable_point_2(1),unstable_point_2(2),'o','Color','Green', ...
    'LineWidth',1,'DisplayName', 'Unstable Equilibrium');

p3 = plot(stable_point(1),stable_point(2),'o','Color','Green', ...
    'LineWidth',1,'DisplayName', 'Stable Equilbirium');
p3.MarkerFaceColor = "green";
p3.MarkerSize = 8;

%plot(x1_line, x2_line, 'go', 'markerfacecolor', 'g');
hold off
hold on

% Simulated solutions using ode45
[t1, sol1] = ode45(f, [0, 30], [5, 1]);
[t2, sol2] = ode45(f, [0, 30], [1, 5]);

% Ploted solution curves
plot(sol1(:,1), sol1(:,2),'m','linewidth', 2,'DisplayName', ...
    'Intial Condition (5,1)');
plot(sol2(:,1), sol2(:,2),'b', 'linewidth', 2,'DisplayName', ...
    'Intial Condition (1,5)');

% Ploted initial conditions
plot(5, 1, 'mo', 'markerfacecolor', 'm', ...
    'DisplayName', 'Intial Condition (5,1)');
plot(1, 5, 'bo', 'markerfacecolor', 'b', ...
    'DisplayName', 'Intial Condition (1,5)');

% Specify the plotting axes
axis([-1, 6, -1, 6]);

% Added legend
legend;
