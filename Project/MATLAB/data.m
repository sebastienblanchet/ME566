% ME561: Final Project
% Sebastien Blanchet

clear; close all; clc;

% Constant parameters
uref = 23.9;
H = 30;
Ld = 15;

theta1 = -20;
theta2 = 10;

% Ref raw data
sim.ref.x0y = xlsread('N:\GitHub\ME566\Project\MATLAB\Data\ref\x0y.csv');
sim.ref.x16y = xlsread('N:\GitHub\ME566\Project\MATLAB\Data\ref\x16y.csv');
sim.ref.x40y = xlsread('N:\GitHub\ME566\Project\MATLAB\Data\ref\x40y.csv');
sim.ref.x90y = xlsread('N:\GitHub\ME566\Project\MATLAB\Data\ref\x90y.csv');
sim.ref.yvect = linspace(0,H/2000,10);

xstr0 =0;
xstr16= 1.6*H/1000;
xstr40 = 4*H/1000;
xstr90 = 9*H/1000;

table2 = xlsread('N:\GitHub\ME566\Project\MATLAB\Data\ref\ref_exp.csv');

exp.y =table2(((table2(:,2) == xstr0) & (table2(:,1)>=0)));
exp.x0y = table2(((table2(:,2) == xstr0) & (table2(:,1)>=0)),3);
exp.x16y = table2(((table2(:,2) == xstr16) & (table2(:,1)>=0)),3);
exp.x40y = table2(((table2(:,2) == xstr40) & (table2(:,1)>=0)),3);
exp.x90y = table2(((table2(:,2) == xstr90) & (table2(:,1)>=0)),3);

% Velocity u
figure(1)
subplot(2,2,1)
hold on 
plot(sim.ref.x0y(:,2), sim.ref.yvect, '*-')
plot(exp.x0y, exp.y, 'o-')
title('$u$ Profile at $X^*=0$','Interpreter','latex');
xlabel('$X$ [m/s]','Interpreter','latex');
ylabel('$Y$ [m]','Interpreter','latex');
legend('Sim.', 'Exp.'),

subplot(2,2,2)
hold on 
plot(sim.ref.x16y(:,2), sim.ref.yvect, '*-')
plot(exp.x16y, exp.y, 'o-')
title('$u$ Profile at $X^*=1.6$','Interpreter','latex');
xlabel('$X$ [m/s]','Interpreter','latex');
ylabel('$Y$ [m]','Interpreter','latex');
legend('Sim.', 'Exp.'),

subplot(2,2,3)
hold on 
plot(sim.ref.x40y(:,2), sim.ref.yvect, '*-')
plot(exp.x40y, exp.y, 'o-')
title('$u$ Profile at $X^*=4$','Interpreter','latex');
xlabel('$X$ [m/s]','Interpreter','latex');
ylabel('$Y$ [m]','Interpreter','latex');
legend('Sim.', 'Exp.'),

subplot(2,2,4)
hold on 
plot(sim.ref.x90y(:,2), sim.ref.yvect, '*-')
plot(exp.x90y, exp.y, 'o-')
title('$u$ Profile at $X^*=9$','Interpreter','latex');
xlabel('$X$ [m/s]','Interpreter','latex');
ylabel('$Y$ [m]','Interpreter','latex');
legend('Sim.', 'Exp.'),
print(1,'-djpeg','Plots/ref_u_all');


% k
exp.x0yk = table2(((table2(:,2) == xstr0) & (table2(:,1)>=0)),8);
exp.x16yk = table2(((table2(:,2) == xstr16) & (table2(:,1)>=0)),8);
exp.x40yk = table2(((table2(:,2) == xstr40) & (table2(:,1)>=0)),8);
exp.x90yk = table2(((table2(:,2) == xstr90) & (table2(:,1)>=0)),8);

figure(2)
subplot(2,2,1)
hold on 
plot(sim.ref.x0y(:,1), sim.ref.yvect, '*-')
plot(exp.x0yk, exp.y, 'o-')
title('$k$ Profile at $X^*=0$','Interpreter','latex');
xlabel('$k$ [m$^2$/s$^2$]','Interpreter','latex');
ylabel('$Y$ [m]','Interpreter','latex');
legend('Sim.', 'Exp.'),

subplot(2,2,2)
hold on 
plot(sim.ref.x16y(:,1), sim.ref.yvect, '*-')
plot(exp.x16yk, exp.y, 'o-')
title('$k$ Profile at $X^*=1.6$','Interpreter','latex');
xlabel('$k$ [m$^2$/s$^2$]','Interpreter','latex');
ylabel('$Y$ [m]','Interpreter','latex');
legend('Sim.', 'Exp.'),

subplot(2,2,3)
hold on 
plot(sim.ref.x40y(:,1), sim.ref.yvect, '*-')
plot(exp.x40yk, exp.y, 'o-')
title('$k$ Profile at $X^*=4$','Interpreter','latex');
xlabel('$k$ [m$^2$/s$^2$]','Interpreter','latex');
ylabel('$Y$ [m]','Interpreter','latex');
legend('Sim.', 'Exp.'),

subplot(2,2,4)
hold on 
plot(sim.ref.x90y(:,1), sim.ref.yvect, '*-')
plot(exp.x90yk, exp.y, 'o-')
title('$k$ Profile at $X^*=9$','Interpreter','latex');
xlabel('$k$ [m$^2$/s$^2$]','Interpreter','latex');
ylabel('$Y$ [m]','Interpreter','latex');
legend('Sim.', 'Exp.'),
print(2,'-djpeg','Plots/ref_k_all');
