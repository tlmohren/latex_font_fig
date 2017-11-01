% startup script executes every time MATLAB starts up
% TMohren 2017 Oct 20
% -------------------------------------------------------
scriptLocation = fileparts(mfilename('fullpath') );
addpath([scriptLocation filesep 'MATLABlibraries' ]);


width = 3;     % Width in inches
height = 3;    % Height in inches
alw = 0.3;    % AxesLineWidth
fsz = 8;      % Fontsize
lw = 0.7;      % LineWidth
msz = 4;       % MarkerSize

% see default settings 
% get(groot,'factory')
% get(groot,'default')

% surfaces 
set(0,'DefaultSurfaceFaceColor','interp');
set(0,'DefaultSurfaceEdgeColor','none');

% Figure text font
set(0,'DefaultAxesFontSize',fsz)% .
set(0,'DefaultLegendFontSize',fsz)% .
% set(0,   'DefaultAxesFontAngle', 'normal', ... % Not sure the difference here
%       'DefaultAxesFontWeight', 'normal', ... % Not sure the difference here

% Figure text font multiplier 
set(0,'DefaultAxesLabelFontSize', 1)
set(0,'DefaultAxesTitleFontSize', 1)
set(0,'DefaultAxesLineWidth',alw)
% set(0,'DefaultAxesLegendFontSize', 1)

% Figure text intepreter
set(0,'defaultTextInterpreter','latex'); 
set(0, 'defaultLegendInterpreter','latex');
set(0, 'defaultAxesTickLabelInterpreter','latex');  

% line and marker settings 
set(0,'defaultLineLineWidth',lw);   % set the default line width to lw
set(0,'defaultLineMarkerSize',msz); % set the default line marker size to msz

% Default figure box settings
% set(0, 'defaultColorbarBox', 'off')

% Set the default Size for display
defpos = get(0,'defaultFigurePosition');
set(0,'defaultFigurePosition', [defpos(1) defpos(2) width*100, height*100]);

% Set the defaults for saving/printing to a file
set(0,'defaultFigureInvertHardcopy','on'); % This is the default anyway
set(0,'defaultFigurePaperUnits','inches'); % This is the default anyway
defsize = get(gcf, 'PaperSize');
left = (defsize(1)- width)/2;
bottom = (defsize(2)- height)/2;
defsize = [left, bottom, width, height];
set(0, 'defaultFigurePaperPosition', defsize);
close all
%--------------------------------------------------------
display('Preferences loaded ')