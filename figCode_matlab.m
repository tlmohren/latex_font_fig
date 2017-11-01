%-----------------------
% Testscript matlab to latex
% TMOHREN 2017 Oct 19
% Issues:
%     saving to svg, saves too big (factor 16/15) 
% 
%------------------------
clc;clear all;close all
% pre plot decisions 
width = 2.5;     % Width in inches,   find column width in paper 
height = 2;    % Height in inches
alw = 0.5;    % AxesLineWidth
fsz = 11;      % Fontsize
lw = 1.5;      % LineWidth
msz = 4;       % MarkerSize
xlab = '$\dot{\theta}$' ;
ylab = '$\frac{\partial \theta}{\partial t}$   ';
lnStl = {'-','-'};
legend_entries = {'sin','$\sin 4 \pi x$'};
legend_location = 'NorthEast';

%% figure treatment
fig = figure();
ax = gca();
set(fig, 'Position', [fig.Position(1:2) width*100, height*100]); %<- Set size

%% Creating signal
x = 0:0.01:1;
y = sin(2*pi*2*x);
y2 = sin(2*pi*2*(x+0.1));

%% Do the plotting
plt1 = plot(x,y);
hold on
plt2 = plot(x,y2);

%% modify linestyle 
pltOpts1 = {'LineStyle',lnStl{1},'LineWidth',lw};
pltOpts2 = {'LineStyle',lnStl{2},'LineWidth',lw};
set(plt1,pltOpts1{:})
set(plt2,pltOpts2{:})

%% labeling of data 
xlabel( xlab);
ylabel( ylab ,'rotation',0);
title('Improved Example Figure');

%% legend setting and adjusting 
legOpts = {'Location', legend_location,'FontSize',fsz};
[leg,lns] = legend(legend_entries );
set(leg,legOpts{:});
lns(3).XData = lns(3).XData + [0.2,0];
lns(5).XData = lns(5).XData + [0.2,0];

%% axis adjustment
axisOpts = {'xtick',0:.5:1,'xticklabel',{0:.5:1}, ...
    'ytick',-1:1:1 ,'yticklabel',{-1:1:1},...
     'FontSize', fsz, 'LineWidth', alw, ...
    'xlim', [-0.1,1.1],'ylim',[-1.1,1.1],...
     'box','off',...
%     'Position',tempPos2 +[0.1,0,0,0],...
     };
set(ax, axisOpts{:})

%% Setting paper size for saving 
set(gca, 'LooseInset', get(gca(), 'TightInset')); % remove whitespace around figure

% % % Here we preserve the size of the image when we save it.
set(fig,'InvertHardcopy','on');
set(fig,'PaperUnits', 'inches');
papersize = get(fig, 'PaperSize');
left = (papersize(1)- width)/2;
bottom = (papersize(2)- height)/2;
myfiguresize = [left, bottom, width, height];
set(fig, 'PaperPosition', myfiguresize);

 
%% saving of image
print(fig, ['figureExample_matlab'], '-dpng', '-r300');

% total hack, why does saving to svg scale image up???
stupid_ratio = 15/16;
myfiguresize = [left, bottom, width*stupid_ratio, height*stupid_ratio];
set(fig, 'PaperPosition', myfiguresize);

print(fig, ['figureExample_matlab'], '-dsvg');