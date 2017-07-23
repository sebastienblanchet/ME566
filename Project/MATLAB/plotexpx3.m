function [ fig ] = plotexpy3(sim, sim1y, sim2y, fignum, name, xname)

    figure(fignum)
    hold on 
    plot(sim.x, sim, '*-')
    plot(sim1.x, sim1y, 'o-')
    plot(sim2.x, sim.yvect, 'x-')
    t1 = strcat('$', name, '$ Profile at $X^*=-0.87$');
    title(t1,'Interpreter','latex');
    xlabel(xname,'Interpreter','latex');
    ylabel('$Y$ [m]','Interpreter','latex');
    legend('Ref.', 'Model 1', 'Model 2')

    plotstr=strcat('Plots\sim2_comp_',name);   
    plotstr=char(plotstr);
    print(fignum,'-djpeg',plotstr);

end

