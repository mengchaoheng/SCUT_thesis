%%
% clear all;
close all;
% clear all;
% set(groot,'defaultLineLineWidth',0.8);% 默认线宽（可选，后文已设置）
% Width  =7.15;    % 保存后的图片宽度
% Height =12;    % 保存后的图片高度
r2d=180/pi;
%% ----------------------------1--------------------------------------------------------------------------------------------
% 阶跃信号
load('ICGNC2020step.mat');
fig1a=figure;%
% Axes=subplot(3,1,1);
plot(time,dca_surfase_out*r2d,'b-','Marker','none','MarkerIndices',tt);hold on;
plot(time,wls_surfase_out*r2d,'r--','Marker','none','MarkerIndices',tt);hold on;grid on;
axis([0 0.5 -2 22]);
xlabel({'时间 (s)','a) 3号操纵面偏转角\delta_3'});ylabel('偏转角 (\circ)')
h=legend('dca','sca');% legend('boxoff');
set(h,'NumColumns',1,'location','northwest');%northwest
% axis([0 xrange -15 15]);Axes.XTick = [0 1 2 3 4];Axes.YTick = [-15 -10 -5 0 5 10 15];% fig1a.CurrentAxes.YTick = [-15 -10 -5 0 5 10 15];
set(fig1a.CurrentAxes, 'FontSize', 10.5,'LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5)
% Axes.FontSize=10.5;Axes.LabelFontSizeMultiplier=1;Axes.TitleFontSizeMultiplier=1;Axes.LineWidth=0.5;
PlotToFileColorPDF(fig1a,'TDF_step_response_a.pdf',14,5);

fig1b=figure;%
% Axes=subplot(3,1,2)
plot(time,dca_T_out,'b-','Marker','none','MarkerIndices',tt);hold on;
plot(time,wls_T_out,'r--','Marker','none','MarkerIndices',tt);hold on;grid on;
axis([0 0.5 -10 90]);
xlabel({'时间 (s)','b) 9号操纵面\delta_9'});ylabel('转速差 (rad/s)')
h=legend('dca','sca');
set(h,'NumColumns',1,'location','northwest');%northwest
set(fig1b.CurrentAxes, 'FontSize', 10.5,'LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5)
% Axes.FontSize=10.5;Axes.LabelFontSizeMultiplier=1;Axes.TitleFontSizeMultiplier=1;Axes.LineWidth=0.5;
PlotToFileColorPDF(fig1b,'TDF_step_response_b.pdf',14,5);

fig1c=figure;%
% Axes=subplot(3,1,3)
plot(time,in_x,'k-','Marker','none','MarkerIndices',tt);hold on;
plot(time,out_dca_x,'Color','b','LineStyle','-.','Marker','x','MarkerIndices',tt,'MarkerSize',5);hold on;
plot(time,out_wls_x,'Color','r','LineStyle','--','Marker','o','MarkerIndices',tt,'MarkerSize',4);hold on;grid on;
axis([0 0.5 -1 7]);
xlabel({'时间 (s)','c) 伪控制输入响应'});ylabel('$\dot p\ \rm(rad/s^2)$','interpreter','latex')
h=legend('cmd','dca','sca');
set(h,'NumColumns',1,'location','northwest');%northwest
set(fig1c.CurrentAxes, 'FontSize', 10.5,'LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5)
% Axes.FontSize=10.5;Axes.LabelFontSizeMultiplier=1;Axes.TitleFontSizeMultiplier=1;Axes.LineWidth=0.5;
PlotToFileColorPDF(fig1c,'TDF_step_response_c.pdf',14,5);

% PlotToFileColorPDF(fig1,'TDF_step_response.pdf',14,14);
%% ----------------------------2--------------------------------------------------------------------------------------------
% load('ICGNC2020freq.mat');
% % fig2=figure;%
% % Axes=subplot(3,1,1)
% fig2a=figure;%
% plot(time,dca_surfase_out*r2d,'b-','Marker','none','MarkerIndices',tt);hold on;
% plot(time,wls_surfase_out*r2d,'r--','Marker','none','MarkerIndices',tt);hold on;grid on;
% axis([0 3 -22 22]);
% xlabel({'时间 (s)','a) 3号操纵面偏转角\delta_3'});ylabel('偏转角 (\circ)')
% h=legend('dca','sca');
% set(h,'NumColumns',1,'location','best');%northwest,,,'LineWidth',2,,'Position',[0.75  0.75 0 0],,, 'FontSize', 9
% set(fig2a.CurrentAxes, 'FontSize', 10.5,'LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5)
% % Axes.FontSize=10.5;Axes.LabelFontSizeMultiplier=1;Axes.TitleFontSizeMultiplier=1;Axes.LineWidth=0.5;
% PlotToFileColorPDF(fig2a,'TDF_chirps_response_a.pdf',14,5);
% 
% fig2b=figure;%
% % Axes=subplot(3,1,2)
% plot(time,dca_T_out,'b-','Marker','none','MarkerIndices',tt);hold on;
% plot(time,wls_T_out,'r--','Marker','none','MarkerIndices',tt);hold on;grid on;
% axis([0 3 -95 85]);
% xlabel({'时间 (s)','b) 9号操纵面\delta_9'});ylabel('转速差 (rad/s)')
% h=legend('dca','sca');
% set(h,'NumColumns',2,'location','best');
% set(fig2b.CurrentAxes, 'FontSize', 10.5,'LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5);
% fig2b.CurrentAxes.YAxis.Exponent = 1;fig2b.CurrentAxes.XTick = [0 0.5 1 1.5 2 2.5 3];
% % Axes.FontSize=10.5;Axes.LabelFontSizeMultiplier=1;Axes.TitleFontSizeMultiplier=1;Axes.LineWidth=0.5;
% PlotToFileColorPDF(fig2b,'TDF_chirps_response_b.pdf',14,5);
% 
% fig2c=figure;%
% % Axes=subplot(3,1,3)
% plot(time,in_x,'k-','Marker','none','MarkerIndices',tt,'MarkerSize',5);hold on;
% plot(time,out_dca_x,'Color','b','LineStyle','-.','Marker','x','MarkerIndices',tt,'MarkerSize',5);hold on;
% plot(time,out_wls_x,'Color','r','LineStyle','--','Marker','o','MarkerIndices',tt,'MarkerSize',4);hold on;grid on;
% axis([0 3 -10 6.6]);
% xlabel({'时间 (s)','c) 伪控制输入响应'});ylabel('$\dot p\ \rm(rad/s^2)$','interpreter','latex')
% h=legend('cmd','dca','sca');
% set(h,'NumColumns',3,'location','best');
% set(fig2c.CurrentAxes, 'FontSize', 10.5,'LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5)
% fig2c.CurrentAxes.XTick = [0 0.5 1 1.5 2 2.5 3];
% % Axes.FontSize=10.5;Axes.LabelFontSizeMultiplier=1;Axes.TitleFontSizeMultiplier=1;Axes.LineWidth=0.5;
% PlotToFileColorPDF(fig2c,'TDF_chirps_response_c.pdf',14,5);
% 
% % PlotToFileColorPDF(fig2,'TDF_chirps_response.pdf',14,14);

%% ----------------------3-------------------------------------
load('ICGNC2020actuator.mat');
% fig3=figure;%
% Axes=subplot(2,2,1);
fig3a=figure;%
p1=plot(time,dca_surfase_in*r2d,'k-','Marker','none','MarkerIndices',tt,'MarkerSize',5);hold on;
plot(time,dca_surfase_out*r2d,'b--','Marker','o','MarkerIndices',tt,'MarkerSize',4);hold on;grid on;
plot(time,wls_surfase_out_off*r2d,'r-.','Marker','x','MarkerIndices',tt,'MarkerSize',5);hold on;
axis([0 3 -22 22]);
xlabel({'时间 (s)','a) 3号操纵面偏转角\delta_3'});ylabel('偏转角 (\circ)')
h=legend('cmd','with','without');
set(h,'NumColumns',3,'location','best');
set(fig3a.CurrentAxes, 'FontSize', 10.5,'LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5)
% Axes.FontSize=10.5;Axes.LabelFontSizeMultiplier=1;Axes.TitleFontSizeMultiplier=1;Axes.LineWidth=0.5;
% fig3a.CurrentAxes.XTick = [0 0.5 1 1.5 2 2.5 3];fig3a.CurrentAxes.YTick = [-0.3 -0.2 -0.1 0 0.1 0.2 0.3];
PlotToFileColorPDF(fig3a,'TDF_chirps_without_comp_a.pdf',14,5);

fig3b=figure;%
% subplot(2,2,2)
plot(time,dca_T_in,'k','Marker','none','MarkerIndices',tt,'MarkerSize',5);hold on;
p2=plot(time,dca_T_out,'b--','Marker','o','MarkerIndices',tt,'MarkerSize',4);hold on;grid on;
plot(time,wls_T_out_off,'r-.','Marker','x','MarkerIndices',tt,'MarkerSize',5);hold on;
axis([0 3 -95 85]);
xlabel({'时间 (s)','b) 9号操纵面\delta_9'});ylabel('转速差 (rad/s)')
h=legend('cmd','with','without');
set(h,'NumColumns',3,'location','best');
set(fig3b.CurrentAxes, 'FontSize', 10.5,'LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5)%
fig3b.CurrentAxes.YAxis.Exponent = 1;
% fig3b.CurrentAxes.XTick = [0 0.5 1 1.5 2 2.5 3];fig3b.CurrentAxes.YTick = [-120 -80 -40 0 40 80 120];
% Axes.XTick = [0 1 2 3 4];Axes.YTick = [-15 -10 -5 0 5 10 15];
PlotToFileColorPDF(fig3b,'TDF_chirps_without_comp_b.pdf',14,5);

fig3c=figure;%
% subplot(2,2,3)
plot(time,in_x,'k-','Marker','none','MarkerIndices',tt,'MarkerSize',5);hold on;
plot(time,out_dca_x,'Color','b','LineStyle','--','Marker','o','MarkerIndices',tt,'MarkerSize',4);hold on;
p3=plot(time,out_wls_x_off,'Color','r','LineStyle','-.','Marker','x','MarkerIndices',tt,'MarkerSize',5);hold on;grid on;
axis([0 3 -10 6.6]);
xlabel({'时间 (s)','c) 伪控制输入响应'});ylabel('$\dot p\ \rm(rad/s^2)$','interpreter','latex')
h=legend('cmd','with','without');
set(h,'NumColumns',3,'location','best');
set(fig3c.CurrentAxes, 'FontSize', 10.5,'LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5)
% fig3c.CurrentAxes.XTick = [0 0.5 1 1.5 2 2.5 3];fig3c.CurrentAxes.YTick = [-6 -4 -2 0 2 4 6];
PlotToFileColorPDF(fig3c,'TDF_chirps_without_comp_c.pdf',14,5);

% PlotToFileColorEPS(fig3,'TDF_chirps_without_comp.pdf',14,14);
