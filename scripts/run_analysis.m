clear all; close all;

% load all data for analysis
load('AllData.mat');

% set up some plotting colors
color_01 = [0, 0.4470, 0.7410]; %blue 
color_02 = [0.9290, 0.6940, 0.1250]; %orange 
color_03 = [0.4660, 0.6740, 0.1880]; %green 
color_04 = [0.4940, 0.1840, 0.5560]; %purple 

% determine x positions for plotting the average across subjects and the average within subjects side by side
xcondticks   = [1 1.5];
xindticks    = [1.1,1.6];
x_Long       = ones(15,1) .* xcondticks(1); %column of 1s length of responses
x_Short      = ones(15,1) .* xcondticks(2); %column of 1.5s leangth of responses
x_Long_ind   = ones(15,1) .* xindticks(1);
x_Short_ind  = ones(15,1) .* xindticks(2);

%other plotting variables
xxmin             = 0.7; 
xxmax             = 1.9;
MarkerSize3       = 60;
MarkerSize3_small = MarkerSize3 * 0.4;
ErLineWidth       = 1;
fontsize          = 9;
color_lightgray   = [0.75,0.75,0.75]; %color of raw data
alphared            = 0.04; %transparency of the red rectangles
difstr            = {'Dif_Start_Pre','Dif_End_Start','Dif_Post_Pre'};
groupstr          = {'Long','Short'};
shapestr          = {'o','d'};
condstr           = {'Persp','Disp','Dual'};
colorstr2         = {'color_01','color_02','color_03'};

% get indices for continuous and intermittent groups
long_inds = find(strcmp(Group,'long'));
short_inds = find(strcmp(Group,'short'));
cont_inds = find(strcmp(Group,'control'));

% make plots of all data (with outliers removed)
plot_all_data;

% Fig 5 (example participant)
plot_fig5_example_participant;

% Fig 6 and slant distortion stats
 plot_fig6_and_run_slant_stats;

% Fig 7 and weighting calcuation
plot_fig7_and_run_weight_stats;

% Fig 8 and shape distortion
plot_fig8_and_run_shape_stats;

% Comparison with control group
shape_control_group_stats


% Exploratory analyses
Exploratory_analyses;
