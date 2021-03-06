function [ fig ] = plotexpy3(sim, sim1, sim2, fignum, name, xname)

    figure(fignum)
    subplot(2,3,1)
    hold on 
    plot(sim.x087y, sim.yvect, '*-')
    plot(sim1.x087y, sim.yvect, 'o-')
    plot(sim2.x087y, sim.yvect, 'x-')
    t1 = strcat('$', name, '$ Profile at $X^*=-0.87$');
    title(t1,'Interpreter','latex');
    xlabel(xname,'Interpreter','latex');
    ylabel('$Y$ [m]','Interpreter','latex');
    legend({'$\theta = 0 ^{\circ}$', '$\theta_1 = -20 ^{\circ}$', ...
        '$\theta_2 = 10 ^{\circ}$'},'Interpreter','latex')

    subplot(2,3,2)
    hold on 
    plot(sim.x0y, sim.yvect, '*-')
    plot(sim1.x0y, sim.yvect, 'o-')
    plot(sim2.x0y, sim.yvect, 'x-')
    t2 = strcat('$', name, '$ Profile at $X^*=0$');
    title(t2,'Interpreter','latex');
    xlabel(xname,'Interpreter','latex');
    ylabel('$Y$ [m]','Interpreter','latex');
%     legend('Ref.', 'Model 1', 'Model 2')
    
    subplot(2,3,3)
    hold on 
    plot(sim.x16y, sim.yvect, '*-')
    plot(sim1.x16y, sim.yvect, 'o-')
    plot(sim2.x16y, sim.yvect, 'x-')
    t3 = strcat('$', name, '$ Profile at $X^*=1.6$');
    title(t3,'Interpreter','latex');
    xlabel(xname,'Interpreter','latex');
    ylabel('$Y$ [m]','Interpreter','latex');
%     legend('Ref.', 'Model 1', 'Model 2')
    
    subplot(2,3,4)
    hold on 
    plot(sim.x25y, sim.yvect, '*-')
    plot(sim1.x25y, sim.yvect, 'o-')
    plot(sim2.x25y, sim.yvect, 'x-')
    t4 = strcat('$', name, '$ Profile at $X^*=2.5$');
    title(t4,'Interpreter','latex');
    xlabel(xname,'Interpreter','latex');
    ylabel('$Y$ [m]','Interpreter','latex');
%     legend('Ref.', 'Model 1', 'Model 2')
    
    subplot(2,3,5)
    hold on 
    plot(sim.x40y, sim.yvect, '*-')
    plot(sim1.x40y, sim.yvect, 'o-')
    plot(sim2.x40y, sim.yvect, 'x-')
    t5 = strcat('$', name, '$ Profile at $X^*=4.0$');
    title(t5,'Interpreter','latex');
    xlabel(xname,'Interpreter','latex');
    ylabel('$Y$ [m]','Interpreter','latex');
%     legend('Ref.', 'Model 1', 'Model 2')
    
    subplot(2,3,6)
    hold on 
    plot(sim.x90y, sim.yvect, '*-')
    plot(sim1.x90y, sim.yvect, 'o-')
    plot(sim2.x90y, sim.yvect, 'x-')
    t6 = strcat('$', name, '$ Profile at $X^*=9$');
    title(t6,'Interpreter','latex');
    xlabel(xname,'Interpreter','latex');
    ylabel('$Y$ [m]','Interpreter','latex');
%     legend('Ref.', 'Model 1', 'Model 2')
    
    plotstr=strcat('Plots\sim_comp',name);   
    plotstr=char(plotstr);
    print(fignum,'-djpeg',plotstr);

end

