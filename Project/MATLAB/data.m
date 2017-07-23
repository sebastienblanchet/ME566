% ME561: Final Project
% Sebastien Blanchet

clear; close all; clc;

%% Exp ref
% Constant parameters
uref = 23.9;
H = 30;
Ld = 15;

theta1 = -20;
theta2 = 10;

% Ref sim data
sim.ref.x0y.data = xlsread('N:\GitHub\ME566\Project\MATLAB\Data\ref\x0y.csv');
sim.ref.x087y.data = xlsread('N:\GitHub\ME566\Project\MATLAB\Data\ref\x087y.csv');
sim.ref.x16y.data = xlsread('N:\GitHub\ME566\Project\MATLAB\Data\ref\x16y.csv');
sim.ref.x25y.data = xlsread('N:\GitHub\ME566\Project\MATLAB\Data\ref\x25y.csv');
sim.ref.x40y.data = xlsread('N:\GitHub\ME566\Project\MATLAB\Data\ref\x40y.csv');
sim.ref.x90y.data = xlsread('N:\GitHub\ME566\Project\MATLAB\Data\ref\x90y.csv');
sim.ref.y0x.data = xlsread('N:\GitHub\ME566\Project\MATLAB\Data\ref\y0x.csv');

% Process
%T
Tcol = 1;
sim.ref.T.yvect = linspace(0,H/2000,10);
sim.ref.T.x087y = sim.ref.x087y.data(:,Tcol);
sim.ref.T.x0y = sim.ref.x0y.data(:,Tcol);
sim.ref.T.x16y = sim.ref.x16y.data(:,Tcol);
sim.ref.T.x25y = sim.ref.x25y.data(:,Tcol);
sim.ref.T.x40y = sim.ref.x40y.data(:,Tcol);
sim.ref.T.x90y = sim.ref.x90y.data(:,Tcol);

% k
kcol = 2;
sim.ref.k.yvect = linspace(0,H/2000,10);
sim.ref.k.x087y = sim.ref.x087y.data(:,kcol);
sim.ref.k.x0y = sim.ref.x0y.data(:,kcol);
sim.ref.k.x16y = sim.ref.x16y.data(:,kcol);
sim.ref.k.x25y = sim.ref.x25y.data(:,kcol);
sim.ref.k.x40y = sim.ref.x40y.data(:,kcol);
sim.ref.k.x90y = sim.ref.x90y.data(:,kcol);

% u
ucol = 3;
sim.ref.u.yvect = linspace(0,H/2000,10);
sim.ref.u.x087y = sim.ref.x087y.data(:,ucol);
sim.ref.u.x0y = sim.ref.x0y.data(:,ucol);
sim.ref.u.x16y = sim.ref.x16y.data(:,ucol);
sim.ref.u.x25y = sim.ref.x25y.data(:,ucol);
sim.ref.u.x40y = sim.ref.x40y.data(:,ucol);
sim.ref.u.x90y = sim.ref.x90y.data(:,ucol);

% v
vcol = 4;
sim.ref.v.yvect = linspace(0,H/2000,10);
sim.ref.v.x087y = sim.ref.x087y.data(:,vcol);
sim.ref.v.x0y = sim.ref.x0y.data(:,vcol);
sim.ref.v.x16y = sim.ref.x16y.data(:,vcol);
sim.ref.v.x25y = sim.ref.x25y.data(:,vcol);
sim.ref.v.x40y = sim.ref.x40y.data(:,vcol);
sim.ref.v.x90y = sim.ref.x90y.data(:,vcol);

clear sim.ref.x0y.data sim.ref.x087y.data sim.ref.x16y.data ...
    sim.ref.x25y.data sim.ref.x40y.data sim.ref.x90y.data

xstr0 =0;
xstr087 = -0.87*Ld/1000;
xstr16 = 1.6*H/1000;
xstr25 = 2.5*H/1000;
xstr40 = 4*H/1000;
xstr90 = 9*H/1000;

% Experimental data import
table2 = xlsread('N:\GitHub\ME566\Project\MATLAB\Data\ref\ref_exp.csv');

% Process data
% u
exp.u.y =table2(((table2(:,2) == xstr0) & (table2(:,1)>=0)));
exp.u.x0y = expref(table2, xstr0, 3);
exp.u.x087y = expref(table2, xstr087, 3);
exp.u.x16y = expref(table2, xstr16, 3);
exp.u.x25y = expref(table2, xstr25, 3);
exp.u.x40y = expref(table2, xstr40, 3);
exp.u.x90y = expref(table2, xstr90, 3);

% v
exp.v.y =table2(((table2(:,2) == xstr0) & (table2(:,1)>=0)));
exp.v.x0y = expref(table2, xstr0, 4);
exp.v.x087y = expref(table2, xstr087, 4);
exp.v.x16y = expref(table2, xstr16, 4);
exp.v.x25y = expref(table2, xstr25, 4);
exp.v.x40y = expref(table2, xstr40, 4);
exp.v.x90y = expref(table2, xstr90, 4);

% k
exp.k.y =table2(((table2(:,2) == xstr0) & (table2(:,1)>=0)));
exp.k.x0y = expref(table2, xstr0, 8);
exp.k.x087y = expref(table2, xstr087, 8);
exp.k.x16y = expref(table2, xstr16, 8);
exp.k.x25y= expref(table2, xstr25, 8);
exp.k.x40y= expref(table2, xstr40, 8);
exp.k.x90y = expref(table2, xstr90, 8);

% Plots
plotexpy2(sim.ref.u, exp.u, 1, 'u', '$u$ [m/s]')
plotexpy2(sim.ref.v, exp.v, 2, 'v', '$v$ [m/s]')
plotexpy2(sim.ref.k, exp.k, 3, 'k','$k$ [m$^2$/s$^2$]')


%% Compare sims
% model1 sim data
sim.model1.x0y.data = xlsread('N:\GitHub\ME566\Project\MATLAB\Data\model1\x0y.csv');
sim.model1.x087y.data = xlsread('N:\GitHub\ME566\Project\MATLAB\Data\model1\x087y.csv');
sim.model1.x16y.data = xlsread('N:\GitHub\ME566\Project\MATLAB\Data\model1\x16y.csv');
sim.model1.x25y.data = xlsread('N:\GitHub\ME566\Project\MATLAB\Data\model1\x25y.csv');
sim.model1.x40y.data = xlsread('N:\GitHub\ME566\Project\MATLAB\Data\model1\x40y.csv');
sim.model1.x90y.data = xlsread('N:\GitHub\ME566\Project\MATLAB\Data\model1\x90y.csv');
sim.model1.y0x.data = xlsread('N:\GitHub\ME566\Project\MATLAB\Data\model1\y0x.csv');

% Process
%T
Tcol=4;
sim.model1.T.yvect = linspace(0,H/2000,10);
sim.model1.T.x087y = sim.model1.x087y.data(:,Tcol);
sim.model1.T.x0y = sim.model1.x0y.data(:,Tcol);
sim.model1.T.x16y = sim.model1.x16y.data(:,Tcol);
sim.model1.T.x25y = sim.model1.x25y.data(:,Tcol);
sim.model1.T.x40y = sim.model1.x40y.data(:,Tcol);
sim.model1.T.x90y = sim.model1.x90y.data(:,Tcol);

%k
kcol=5;
sim.model1.k.yvect = linspace(0,H/2000,10);
sim.model1.k.x087y = sim.model1.x087y.data(:,kcol);
sim.model1.k.x0y = sim.model1.x0y.data(:,kcol);
sim.model1.k.x16y = sim.model1.x16y.data(:,kcol);
sim.model1.k.x25y = sim.model1.x25y.data(:,kcol);
sim.model1.k.x40y = sim.model1.x40y.data(:,kcol);
sim.model1.k.x90y = sim.model1.x90y.data(:,kcol);

% u
ucol = 6;
sim.model1.u.yvect = linspace(0,H/2000,10);
sim.model1.u.x087y = sim.model1.x087y.data(:,ucol);
sim.model1.u.x0y = sim.model1.x0y.data(:,ucol);
sim.model1.u.x16y = sim.model1.x16y.data(:,ucol);
sim.model1.u.x25y = sim.model1.x25y.data(:,ucol);
sim.model1.u.x40y = sim.model1.x40y.data(:,ucol);
sim.model1.u.x90y = sim.model1.x90y.data(:,ucol);

% v
vcol =7;
sim.model1.v.yvect = linspace(0,H/2000,10);
sim.model1.v.x087y = sim.model1.x087y.data(:,vcol);
sim.model1.v.x0y = sim.model1.x0y.data(:,vcol);
sim.model1.v.x16y = sim.model1.x16y.data(:,vcol);
sim.model1.v.x25y = sim.model1.x25y.data(:,vcol);
sim.model1.v.x40y = sim.model1.x40y.data(:,vcol);
sim.model1.v.x90y = sim.model1.x90y.data(:,vcol);

clear model1.ref.x0y.data model1.ref.x087y.data model1.ref.x16y.data ...
    model1.ref.x25y.data model1.ref.x40y.data model1.ref.x90y.data


% model2 sim data
sim.model2.x0y.data = xlsread('N:\GitHub\ME566\Project\MATLAB\Data\model2\x0y.csv');
sim.model2.x087y.data = xlsread('N:\GitHub\ME566\Project\MATLAB\Data\model2\x087y.csv');
sim.model2.x16y.data = xlsread('N:\GitHub\ME566\Project\MATLAB\Data\model2\x16y.csv');
sim.model2.x25y.data = xlsread('N:\GitHub\ME566\Project\MATLAB\Data\model2\x25y.csv');
sim.model2.x40y.data = xlsread('N:\GitHub\ME566\Project\MATLAB\Data\model2\x40y.csv');
sim.model2.x90y.data = xlsread('N:\GitHub\ME566\Project\MATLAB\Data\model2\x90y.csv');
sim.model2.y0x.data = xlsread('N:\GitHub\ME566\Project\MATLAB\Data\model2\y0x.csv');

% Process
%T
Tcol=4;
sim.model2.T.yvect = linspace(0,H/2000,10);
sim.model2.T.x087y = sim.model2.x087y.data(:,Tcol);
sim.model2.T.x0y = sim.model2.x0y.data(:,Tcol);
sim.model2.T.x16y = sim.model2.x16y.data(:,Tcol);
sim.model2.T.x25y = sim.model2.x25y.data(:,Tcol);
sim.model2.T.x40y = sim.model2.x40y.data(:,Tcol);
sim.model2.T.x90y = sim.model2.x90y.data(:,Tcol);

%k
kcol=5;
sim.model2.k.yvect = linspace(0,H/2000,10);
sim.model2.k.x087y = sim.model2.x087y.data(:,kcol);
sim.model2.k.x0y = sim.model2.x0y.data(:,kcol);
sim.model2.k.x16y = sim.model2.x16y.data(:,kcol);
sim.model2.k.x25y = sim.model2.x25y.data(:,kcol);
sim.model2.k.x40y = sim.model2.x40y.data(:,kcol);
sim.model2.k.x90y = sim.model2.x90y.data(:,kcol);

% u
ucol = 6;
sim.model2.u.yvect = linspace(0,H/2000,10);
sim.model2.u.x087y = sim.model2.x087y.data(:,ucol);
sim.model2.u.x0y = sim.model2.x0y.data(:,ucol);
sim.model2.u.x16y = sim.model2.x16y.data(:,ucol);
sim.model2.u.x25y = sim.model2.x25y.data(:,ucol);
sim.model2.u.x40y = sim.model2.x40y.data(:,ucol);
sim.model2.u.x90y = sim.model2.x90y.data(:,ucol);

% v
vcol =7;
sim.model2.v.yvect = linspace(0,H/2000,10);
sim.model2.v.x087y = sim.model2.x087y.data(:,vcol);
sim.model2.v.x0y = sim.model2.x0y.data(:,vcol);
sim.model2.v.x16y = sim.model2.x16y.data(:,vcol);
sim.model2.v.x25y = sim.model2.x25y.data(:,vcol);
sim.model2.v.x40y = sim.model2.x40y.data(:,vcol);
sim.model2.v.x90y = sim.model2.x90y.data(:,vcol);

clear model2.ref.x0y.data model2.ref.x087y.data model2.ref.x16y.data ...
    model2.ref.x25y.data model2.ref.x40y.data model2.ref.x90y.data

% Plots
plotexpy3(sim.ref.u, sim.model1.u, sim.model2.u, 4, 'u', '$u$ [m/s]')
plotexpy3(sim.ref.v, sim.model1.v, sim.model2.v, 5, 'v', '$v$ [m/s]')
plotexpy3(sim.ref.k, sim.model1.k, sim.model2.k, 6, 'k','$k$ [m$^2$/s$^2$]')
plotexpy3(sim.ref.T, sim.model1.T, sim.model2.T, 7, 'T','$T$ [$^{\circ}$C]')


%% Compare along x

% ref
sim.ref.x = sim.ref.y0x.data(:,1);
sim.ref.T = sim.ref.y0x.data(:,4);
sim.ref.k = sim.ref.y0x.data(:,5);
sim.ref.V = sim.ref.y0x.data(:,6);

% model 1
sim.model1.x = sim.model1.y0x.data(:,1);
sim.model1.T = sim.model1.y0x.data(:,4);
sim.model1.k = sim.model1.y0x.data(:,5);
sim.model1.V = sim.model1.y0x.data(:,6);

% model 3
sim.model2.x = sim.model2.y0x.data(:,1);
sim.model2.T = sim.model2.y0x.data(:,4);
sim.model2.k = sim.model2.y0x.data(:,5);
sim.model2.V = sim.model2.y0x.data(:,6);

figure(8)
hold on 
plot(sim.ref.x, sim.ref.T-273.15, '*-')
plot(sim.model1.x, sim.model1.T-273.15, 'o-')
plot(sim.model2.x, sim.model2.T-273.15, 'x-')
title('$T$ Profile at $Y^*=0$','Interpreter','latex');
xlabel('$X$ [m]','Interpreter','latex');
ylabel('$T$ [$^{\circ}$C]','Interpreter','latex');
legend('Ref.', 'Model 1', 'Model 2')
plotstr=strcat('Plots\sim2_comp_T');   
plotstr=char(plotstr);
print(8,'-djpeg',plotstr);

figure(9)
hold on 
plot(sim.ref.x, sim.ref.k, '*-')
plot(sim.model1.x, sim.model1.k, 'o-')
plot(sim.model2.x, sim.model2.k, 'x-')
title('$k$ Profile at $Y^*=0$','Interpreter','latex');
xlabel('$X$ [m]','Interpreter','latex');
ylabel('$k$ [m$^2$/s$^2$]','Interpreter','latex');
legend('Ref.', 'Model 1', 'Model 2')
plotstr=strcat('Plots\sim2_comp_k');   
plotstr=char(plotstr);
print(9,'-djpeg',plotstr);

figure(10)
hold on 
plot(sim.ref.x, sim.ref.V, '*-')
plot(sim.model1.x, sim.model1.V, 'o-')
plot(sim.model2.x, sim.model2.V, 'x-')
title('$$\vec{V}$$ Profile at $Y^*=0$','Interpreter','latex');
xlabel('$X$ [m]','Interpreter','latex');
ylabel('$$\vec{V}$$ [m/s]','Interpreter','latex');
legend('Ref.', 'Model 1', 'Model 2')
print(10,'-djpeg','Plots\sim2_comp_V');

