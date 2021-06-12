function PlotToFileColorPDF(gcf,filename,x,y)
%
% Print the current plot at size (x,y) to an eps file
%
set(gcf,'PaperUnits','centimeters')
set(gcf,'PaperSize',[x,y])
set(gcf,'PaperPositionMode','manual')
set(gcf,'PaperPosition',[0,0,x,y]);
set(gcf, 'renderer', 'painters');
print(filename,'-dpdf','-r600')
% export_fig( gcf , '-pdf' , '-r600' , '-painters' , './filename');
% print(gcf, '-dpdf','-r600', '.\filename'); 

end
