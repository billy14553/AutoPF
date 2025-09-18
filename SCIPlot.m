function h = SCIPlot()
%     grid off;
%     box on;
%     set(gca,'Linewidth',2);
%     %Changing Axis Properties
%     a=gca;
%     a.FontSize=16;%20
%     a.FontName='Times New Romas';
%     %a.FontWeight='bold';
%     a.Box='on';
%     set(gca,'fontweight','bold')
%     set(gca,'looseInset',[0.01 0.01 0.01 0.01])
%     set(gcf,'color','w');
%     set(gca,'linewidth',1.5);
%     set(gcf, 'Renderer', 'painters');       % 使用矢量渲染
% %set(gca, 'FontName', 'Times New Romas');          % 改用系统通用字体
% %set(gca, 'FontSize', 12);               % 避免过小字号
% %set(gcf, 'GraphicsSmoothing', 'on');    % 启用抗锯齿

    grid off;
    box on;
    set(gca,'Linewidth',2);
    %Changing Axis Properties
    a=gca;
    a.FontSize=16;%20
    a.FontName='Times New Roman';
    %a.FontWeight='bold';
    a.Box='on';
    %set(gca,'fontweight','bold')
    set(gca,'looseInset',[0.01 0.01 0.01 0.01])
    set(gcf,'color','w');
    set(gca,'linewidth',1.5);
    set(gcf, 'Renderer', 'painters');       % 使用矢量渲染
set(gca, 'FontName', 'Times New Roman');          % 改用系统通用字体
 
set(gcf, 'GraphicsSmoothing', 'on');    % 启用抗锯齿


end

