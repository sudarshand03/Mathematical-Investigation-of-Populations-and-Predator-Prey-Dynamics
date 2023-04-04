%% Question 3 Set B)
% intervals x1min < x1 < x1max, x2min < x2 < x2max
    x1min = -1; x1max = 6; x2min = -1; x2max = 6;
% Step 2: pick step sizes for x1 and x2;
    x1step = 0.1; x2step = 0.1; 
% generate mesh for plotting
    [x1, x2] = meshgrid(x1min:x1step:x1max, x2min:x2step:x2max);
% Step 3: define all needed parameter values 
alpha = 1.5;
beta = 1.1;
delta = 1.4;
gamma = 2.5;
% Step 4: define the system of equations you are using
    dx1 = -alpha.*x1 + beta.*x1.*x2; 
    dx2 = gamma.*x2 - delta.*x1.*x2;
 

% normalize vectors (to help plotting)
    dx1 = dx1./sqrt(dx1.^2 + dx2.^2); 
    dx2 = dx2./sqrt(dx1.^2 + dx2.^2); 



% generate the vector field
figure;
    quiver(x1, x2, dx1,dx2,'AutoScaleFactor',0.5', 'DisplayName', 'Vector Field')
% specify the plotting axes
    axis([x1min x1max x2min x2max])
% Step 5: label the axes, include a title    
    xlabel('$x_1$ Predator','Interpreter','latex')
    ylabel('$x_2$ Prey','Interpreter','latex')
    title('Direction Field Lotka Voltera System','Interpreter','latex')

vnull1 = 0;
vnull2 = alpha/beta;

hnull1=0;
hnull2=gamma/delta;

hold on;
xline(vnull1,'Color','red','LineWidth',2, 'DisplayName', 'V Nullcline 1');
hold on;
yline(vnull2,'Color','red','LineWidth',2, 'DisplayName','V Nullcline 2')
hold on;
xline(hnull2,'Color','Black','LineWidth',2,'DisplayName','H Nulllcline 1');
hold on;
yline(hnull1,'Color','Black','LineWidth',2,'DisplayName','H Nullcline 2');

% Equilibrium points
unstable_point = [0; 0];
stable_point = [gamma/delta; alpha/beta];

%plot
hold on;
p1 = plot(unstable_point(1),unstable_point(2),'o','Color','Green', ...
    'LineWidth',1,'DisplayName', 'Unstable Equilibrium');
hold on;
p2 = plot(stable_point(1),stable_point(2),'o','Color','Green', ...
    'LineWidth',1, 'DisplayName','Stable Equilbrium');
p2.MarkerFaceColor = "green";
p2.MarkerSize = 8;
xlim([-1.00 6.00])
ylim([-1.00 6.00])
hold off;
legend;