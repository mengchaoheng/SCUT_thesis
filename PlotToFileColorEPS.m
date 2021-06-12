function PlotToFileColorEPS(gcf,filename,x,y)
%
% Print the current plot at size (x,y) to an eps file
%
set(gcf,'PaperUnits','centimeters')
set(gcf,'PaperSize',[x,y])
set(gcf,'PaperPositionMode','manual')
set(gcf,'PaperPosition',[0,0,x,y]);
set(gcf, 'renderer', 'painters');
print(filename,'-depsc','-r600')
% print(gcf,[filename,'tif'],'-r600','-dtiff');
end
