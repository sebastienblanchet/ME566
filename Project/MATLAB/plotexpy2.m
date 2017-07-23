function [ fig ] = plotexpy2(sim, exp, fignum, name, xname)

    figure(fignum)
    subplot(2,3,1)
    hold on 
    plot(sim.x087y, sim.yvect, '*-')
    plot(exp.x087y, exp.y, 'o-')
    t1 = strcat('$', name, '$ Profile at $X^*=-0.87$');
    title(t1,'Interpreter','latex');
    xlabel(xname,'Interpreter','latex');
    ylabel('$Y$ [m]','Interpreter','latex');
    legend('Sim.', 'Exp.')

    subplot(2,3,2)
    hold on 
    plot(sim.x0y, sim.yvect, '*-')
    plot(exp.x0y, exp.y, 'o-')
    t2 = strcat('$', name, '$ Profile at $X^*=0$');
    title(t2,'Interpreter','latex');
    xlabel(xname,'Interpreter','latex');
    ylabel('$Y$ [m]','Interpreter','latex');
    legend('Sim.', 'Exp.')
    
    subplot(2,3,3)
    hold on 
    plot(sim.x16y, sim.yvect, '*-')
    plot(exp.x16y, exp.y, 'o-')
    t3 = strcat('$', name, '$ Profile at $X^*=1.6$');
    title(t3,'Interpreter','latex');
    xlabel(xname,'Interpreter','latex');
    ylabel('$Y$ [m]','Interpreter','latex');
    legend('Sim.', 'Exp.')
    
    subplot(2,3,4)
    hold on 
    plot(sim.x25y, sim.yvect, '*-')
    plot(exp.x25y, exp.y, 'o-')
    t4 = strcat('$', name, '$ Profile at $X^*=2.5$');
    title(t4,'Interpreter','latex');
    xlabel(xname,'Interpreter','latex');
    ylabel('$Y$ [m]','Interpreter','latex');
    legend('Sim.', 'Exp.')
    
    subplot(2,3,5)
    hold on 
    plot(sim.x40y, sim.yvect, '*-')
    plot(exp.x40y, exp.y, 'o-')
    t5 = strcat('$', name, '$ Profile at $X^*=4.0$');
    title(t5,'Interpreter','latex');
    xlabel(xname,'Interpreter','latex');
    ylabel('$Y$ [m]','Interpreter','latex');
    legend('Sim.', 'Exp.')
    
    subplot(2,3,6)
    hold on 
    plot(sim.x90y, sim.yvect, '*-')
    plot(exp.x90y, exp.y, 'o-')
    t6 = strcat('$', name, '$ Profile at $X^*=9$');
    title(t6,'Interpreter','latex');
    xlabel(xname,'Interpreter','latex');
    ylabel('$Y$ [m]','Interpreter','latex');
    legend('Sim.', 'Exp.'),
    
    plotstr=strcat('Plots\exp_ref_',name);   
    plotstr=char(plotstr);
    print(fignum,'-djpeg',plotstr);

end

