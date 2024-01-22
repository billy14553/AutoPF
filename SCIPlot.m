function h = SCIPlot()
    grid off;
    box on;
    set(gca,'Linewidth',2);
    %Changing Axis Properties
    a=gca;
    a.FontSize=16;%20
    a.FontName='Helvetica';
    %a.FontWeight='bold';
    a.Box='on';
    %set(gca,'fontweight','bold')
    set(gca,'looseInset',[0.01 0.01 0.01 0.01])
    set(gcf,'color','w');
    set(gca,'linewidth',1.5);
end

