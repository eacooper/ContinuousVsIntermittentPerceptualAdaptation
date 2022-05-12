% plot the slant difference scores from Figure 6 and run statistical tests
close all;

%% INTIAL CALCULATIONS

% calculate the difference scores for each subject for each condition

%Perspective differences for each group
Persp_Dif_Start_Pre_Long  = squeeze(nanmean(Persp(:,2,long_inds)) - nanmean(Persp(:,1,long_inds))); % start minus pre
Persp_Dif_End_Start_Long  = squeeze(nanmean(Persp(:,3,long_inds)) - nanmean(Persp(:,2,long_inds))); % end minus start
Persp_Dif_Post_Pre_Long   = squeeze(nanmean(Persp(:,4,long_inds)) - nanmean(Persp(:,1,long_inds))); % start minus pre

Persp_Dif_Start_Pre_Short  = squeeze(nanmean(Persp(:,2,short_inds)) - nanmean(Persp(:,1,short_inds))); % start minus pre
Persp_Dif_End_Start_Short  = squeeze(nanmean(Persp(:,3,short_inds)) - nanmean(Persp(:,2,short_inds))); % end minus start
Persp_Dif_Post_Pre_Short   = squeeze(nanmean(Persp(:,4,short_inds)) - nanmean(Persp(:,1,short_inds))); % start minus pre

%Disparity differences for each group
Disp_Dif_Start_Pre_Long  = squeeze(nanmean(Disp(:,2,long_inds)) - nanmean(Disp(:,1,long_inds))); % start minus pre
Disp_Dif_End_Start_Long  = squeeze(nanmean(Disp(:,3,long_inds)) - nanmean(Disp(:,2,long_inds))); % end minus start
Disp_Dif_Post_Pre_Long   = squeeze(nanmean(Disp(:,4,long_inds)) - nanmean(Disp(:,1,long_inds))); % start minus pre

Disp_Dif_Start_Pre_Short  = squeeze(nanmean(Disp(:,2,short_inds)) - nanmean(Disp(:,1,short_inds))); % start minus pre
Disp_Dif_End_Start_Short  = squeeze(nanmean(Disp(:,3,short_inds)) - nanmean(Disp(:,2,short_inds))); % end minus start
Disp_Dif_Post_Pre_Short   = squeeze(nanmean(Disp(:,4,short_inds)) - nanmean(Disp(:,1,short_inds))); % start minus pre

%Dual cue differences for each group
Dual_Dif_Start_Pre_Long  = squeeze(nanmean(Dual(:,2,long_inds)) - nanmean(Dual(:,1,long_inds))); % start minus pre
Dual_Dif_End_Start_Long  = squeeze(nanmean(Dual(:,3,long_inds)) - nanmean(Dual(:,2,long_inds))); % end minus start
Dual_Dif_Post_Pre_Long   = squeeze(nanmean(Dual(:,4,long_inds)) - nanmean(Dual(:,1,long_inds))); % start minus pre

Dual_Dif_Start_Pre_Short  = squeeze(nanmean(Dual(:,2,short_inds)) - nanmean(Dual(:,1,short_inds))); % start minus pre
Dual_Dif_End_Start_Short  = squeeze(nanmean(Dual(:,3,short_inds)) - nanmean(Dual(:,2,short_inds))); % end minus start
Dual_Dif_Post_Pre_Short   = squeeze(nanmean(Dual(:,4,short_inds)) - nanmean(Dual(:,1,short_inds))); % start minus pre

% calculate mean and standard deviation of each group across subjects

%mean
Avg_Persp_Dif_Start_Pre_Long    = mean(Persp_Dif_Start_Pre_Long);
Avg_Persp_Dif_End_Start_Long    = mean(Persp_Dif_End_Start_Long);
Avg_Persp_Dif_Post_Pre_Long     = mean(Persp_Dif_Post_Pre_Long);

Avg_Persp_Dif_Start_Pre_Short    = mean(Persp_Dif_Start_Pre_Short);
Avg_Persp_Dif_End_Start_Short    = mean(Persp_Dif_End_Start_Short);
Avg_Persp_Dif_Post_Pre_Short     = mean(Persp_Dif_Post_Pre_Short);

Avg_Disp_Dif_Start_Pre_Long    = mean(Disp_Dif_Start_Pre_Long);
Avg_Disp_Dif_End_Start_Long    = mean(Disp_Dif_End_Start_Long);
Avg_Disp_Dif_Post_Pre_Long     = mean(Disp_Dif_Post_Pre_Long);

Avg_Disp_Dif_Start_Pre_Short    = mean(Disp_Dif_Start_Pre_Short);
Avg_Disp_Dif_End_Start_Short    = mean(Disp_Dif_End_Start_Short);
Avg_Disp_Dif_Post_Pre_Short     = mean(Disp_Dif_Post_Pre_Short);

Avg_Dual_Dif_Start_Pre_Long    = mean(Dual_Dif_Start_Pre_Long);
Avg_Dual_Dif_End_Start_Long    = mean(Dual_Dif_End_Start_Long);
Avg_Dual_Dif_Post_Pre_Long     = mean(Dual_Dif_Post_Pre_Long);

Avg_Dual_Dif_Start_Pre_Short    = mean(Dual_Dif_Start_Pre_Short);
Avg_Dual_Dif_End_Start_Short    = mean(Dual_Dif_End_Start_Short);
Avg_Dual_Dif_Post_Pre_Short     = mean(Dual_Dif_Post_Pre_Short);

% std
Std_Persp_Dif_Start_Pre_Long    = std(Persp_Dif_Start_Pre_Long);
Std_Persp_Dif_End_Start_Long    = std(Persp_Dif_End_Start_Long);
Std_Persp_Dif_Post_Pre_Long     = std(Persp_Dif_Post_Pre_Long);

Std_Persp_Dif_Start_Pre_Short    = std(Persp_Dif_Start_Pre_Short);
Std_Persp_Dif_End_Start_Short    = std(Persp_Dif_End_Start_Short);
Std_Persp_Dif_Post_Pre_Short     = std(Persp_Dif_Post_Pre_Short);

Std_Disp_Dif_Start_Pre_Long    = std(Disp_Dif_Start_Pre_Long);
Std_Disp_Dif_End_Start_Long    = std(Disp_Dif_End_Start_Long);
Std_Disp_Dif_Post_Pre_Long     = std(Disp_Dif_Post_Pre_Long);

Std_Disp_Dif_Start_Pre_Short    = std(Disp_Dif_Start_Pre_Short);
Std_Disp_Dif_End_Start_Short    = std(Disp_Dif_End_Start_Short);
Std_Disp_Dif_Post_Pre_Short     = std(Disp_Dif_Post_Pre_Short);

Std_Dual_Dif_Start_Pre_Long    = std(Dual_Dif_Start_Pre_Long);
Std_Dual_Dif_End_Start_Long    = std(Dual_Dif_End_Start_Long);
Std_Dual_Dif_Post_Pre_Long     = std(Dual_Dif_Post_Pre_Long);

Std_Dual_Dif_Start_Pre_Short    = std(Dual_Dif_Start_Pre_Short);
Std_Dual_Dif_End_Start_Short    = std(Dual_Dif_End_Start_Short);
Std_Dual_Dif_Post_Pre_Short     = std(Dual_Dif_Post_Pre_Short);

%% STATS

display('**INITIAL SLANT DISTORTION**');

%TEXTURE
% continuous - single sample t-test of start-pre
[h,p,ci,stats] = ttest(Persp_Dif_Start_Pre_Long);
d = (Avg_Persp_Dif_Start_Pre_Long)/ Std_Persp_Dif_Start_Pre_Long;

display('Single Sample t: Perspective, continuous group start - pre');
display(['Mcont = ' num2str(Avg_Persp_Dif_Start_Pre_Long,3) ' +/- ' num2str(Std_Persp_Dif_Start_Pre_Long,3) ...
    ', t(' num2str(stats.df) ') = ' num2str(stats.tstat,3) ', p = ' num2str(p,3) ', d = ' num2str(d,3) ]);
display(' ');

% intermittent - single sample t-test of start-pre
[h,p,ci,stats] = ttest(Persp_Dif_Start_Pre_Short);
d = (Avg_Persp_Dif_Start_Pre_Short)/ Std_Persp_Dif_Start_Pre_Short;

display('Single Sample t: Perspective, intermittent group start - pre');
display(['Minter = ' num2str(Avg_Persp_Dif_Start_Pre_Short,3) ' +/- ' num2str(Std_Persp_Dif_Start_Pre_Short,3) ...
    ', t(' num2str(stats.df) ') = ' num2str(stats.tstat,3) ', p = ' num2str(p,3) ', d = ' num2str(d,3) ]);
display(' ');

%DISPARITY
% continuous - single sample t-test of start-pre
[h,p,ci,stats] = ttest(Disp_Dif_Start_Pre_Long);
d = (Avg_Disp_Dif_Start_Pre_Long)/ Std_Disp_Dif_Start_Pre_Long;

display('Single Sample t: Disparity, continuous group start - pre');
display(['Mcont = ' num2str(Avg_Disp_Dif_Start_Pre_Long,3) ' +/- ' num2str(Std_Disp_Dif_Start_Pre_Long,3) ...
    ', t(' num2str(stats.df) ') = ' num2str(stats.tstat,3) ', p = ' num2str(p,3) ', d = ' num2str(d,3) ]);
display(' ');

% Intermittent - single sample t-test of start-pre
[h,p,ci,stats] = ttest(Disp_Dif_Start_Pre_Short);
d = (Avg_Disp_Dif_Start_Pre_Short)/ Std_Disp_Dif_Start_Pre_Short;

display('Single Sample t: Disparity, intermittent group start - pre');
display(['Minter = ' num2str(Avg_Disp_Dif_Start_Pre_Short,3) ' +/- ' num2str(Std_Disp_Dif_Start_Pre_Short,3) ...
    ', t(' num2str(stats.df) ') = ' num2str(stats.tstat,3) ', p = ' num2str(p,3) ', d = ' num2str(d,3) ]);
display(' ');

% compare start - pre in both groups to expected effect of glasses (-9.83)

% continuous - single sample t-test of start-pre versus -9.83
[h,p,ci,stats] = ttest(Disp_Dif_Start_Pre_Long,-9.83);

display('Single Sample t: Disparity, continuous group start - pre versus 9.83');
display(['Contv983 = t(' num2str(stats.df) ') = ' num2str(stats.tstat,3) ', p = ' num2str(p,3) ]);
display(' ');

% intermittent - single sample t-test of start-pre versus -9.83
[h,p,ci,stats] = ttest(Disp_Dif_Start_Pre_Short,-9.83);

display('Single Sample t: Disparity, intermittent group start - pre versus 9.83');
display(['Interv983 = t(' num2str(stats.df) ') = ' num2str(stats.tstat,3) ', p = ' num2str(p,3) ]);
display(' ');

%DUAL CUE
% continuous - single sample t-test of start-pre
[h,p,ci,stats] = ttest(Dual_Dif_Start_Pre_Long);
d = (Avg_Dual_Dif_Start_Pre_Long)/ Std_Dual_Dif_Start_Pre_Long;

display('Single Sample t: Dual Cue, continuous group start - pre');
display(['Mcont = ' num2str(Avg_Dual_Dif_Start_Pre_Long,3) ' +/- ' num2str(Std_Dual_Dif_Start_Pre_Long,3) ...
    ', t(' num2str(stats.df) ') = ' num2str(stats.tstat,3) ', p = ' num2str(p,3) ', d = ' num2str(d,3) ]);
display(' ');

% Intermittent - single sample t-test of start-pre
[h,p,ci,stats] = ttest(Dual_Dif_Start_Pre_Short);
d = (Avg_Dual_Dif_Start_Pre_Short)/ Std_Dual_Dif_Start_Pre_Short;

display('Single Sample t: Dual Cue, intermittent group start - pre');
display(['Minter = ' num2str(Avg_Dual_Dif_Start_Pre_Short,3) ' +/- ' num2str(Std_Dual_Dif_Start_Pre_Short,3) ...
    ', t(' num2str(stats.df) ') = ' num2str(stats.tstat,3) ', p = ' num2str(p,3) ', d = ' num2str(d,3) ]);
display(' ');

%UNPAIRED T TEST
% Perspective - unpaired start-pre
[h,p,ci,stats] = ttest2(Persp_Dif_Start_Pre_Long,Persp_Dif_Start_Pre_Short);
d = (Avg_Persp_Dif_Start_Pre_Long - Avg_Persp_Dif_Start_Pre_Short) / std([Persp_Dif_Start_Pre_Long;Persp_Dif_Start_Pre_Short]);

display('Unpaired t: Perspective, continuous compared to intermittent start - pre');
display(['t(' num2str(stats.df) ') = ' num2str(stats.tstat,3) ', p = ' num2str(p,3) ', d = ' num2str(d,3) ]);
display(' ');

% Disparity - unpaired start-pre
[h,p,ci,stats] = ttest2(Disp_Dif_Start_Pre_Long,Disp_Dif_Start_Pre_Short);
d = (Avg_Disp_Dif_Start_Pre_Long - Avg_Disp_Dif_Start_Pre_Short) / std([Disp_Dif_Start_Pre_Long;Disp_Dif_Start_Pre_Short]);

display('Unpaired t: Disparity, continuous compared to intermittent start - pre');
display(['t(' num2str(stats.df) ') = ' num2str(stats.tstat,3) ', p = ' num2str(p,3) ', d = ' num2str(d,3) ]);
display(' ');

% Dual Cue - unpaired start-pre
[h,p,ci,stats] = ttest2(Dual_Dif_Start_Pre_Long,Dual_Dif_Start_Pre_Short);
d = (Avg_Dual_Dif_Start_Pre_Long - Avg_Dual_Dif_Start_Pre_Short) / std([Dual_Dif_Start_Pre_Long;Dual_Dif_Start_Pre_Short]);

display('Unpaired t: Dual cue, continuous compared to intermittent start - pre');
display(['t(' num2str(stats.df) ') = ' num2str(stats.tstat,3) ', p = ' num2str(p,3) ', d = ' num2str(d,3) ]);
display(' ');



display('**SLANT ADAPTATION FROM PERSPECTIVE**');

%PERSPECTIVE end - start
% continuous - One sample t test end - start
[h,p,ci,stats] = ttest(Persp_Dif_End_Start_Long);
d = (Avg_Persp_Dif_End_Start_Long)/ Std_Persp_Dif_End_Start_Long;

display('Single Sample t: Perspective, continuous group end - start');
display(['Mcont = ' num2str(Avg_Persp_Dif_End_Start_Long,3) ' +/- ' num2str(Std_Persp_Dif_End_Start_Long,3) ...
    ', t(' num2str(stats.df) ') = ' num2str(stats.tstat,3) ', p = ' num2str(p,3) ', d = ' num2str(d,3) ]);
display(' ');

% intermittent - One sample t test end - start
[h,p,ci,stats] = ttest(Persp_Dif_End_Start_Short);
d = (Avg_Persp_Dif_End_Start_Short)/ Std_Persp_Dif_End_Start_Short;

display('Single Sample t: Perspective, intermittent group end - start');
display(['Minter = ' num2str(Avg_Persp_Dif_End_Start_Short,3) ' +/- ' num2str(Std_Persp_Dif_End_Start_Short,3) ...
    ', t(' num2str(stats.df) ') = ' num2str(stats.tstat,3) ', p = ' num2str(p,3) ', d = ' num2str(d,3) ]);
display(' ');

%Unpaired T test
[h,p,ci,stats] = ttest2(Persp_Dif_End_Start_Long,Persp_Dif_End_Start_Short);
d = (Avg_Persp_Dif_End_Start_Long - Avg_Persp_Dif_End_Start_Short) / std([Persp_Dif_End_Start_Long;Persp_Dif_End_Start_Short]);

display('Single Sample t: Perspective, continuous compared to intermittent end - start');
display(['t(' num2str(stats.df) ') = ' num2str(stats.tstat,3) ', p = ' num2str(p,3) ', d = ' num2str(d,3) ]);
display(' ');

%PERSPECTIVE  post - pre
% continuous - One sample t test post - pre
[h,p,ci,stats] = ttest(Persp_Dif_Post_Pre_Long);
d = (Avg_Persp_Dif_Post_Pre_Long)/ Std_Persp_Dif_Post_Pre_Long;

display('Single Sample t: Perspective, continuous group post - pre');
display(['Mcont = ' num2str(Avg_Persp_Dif_Post_Pre_Long,3) ' +/- ' num2str(Std_Persp_Dif_Post_Pre_Long,3) ...
    ', t(' num2str(stats.df) ') = ' num2str(stats.tstat,3) ', p = ' num2str(p,3) ', d = ' num2str(d,3) ]);
display(' ');

% intermittent - One sample t test post - pre
[h,p,ci,stats] = ttest(Persp_Dif_Post_Pre_Short);
d = (Avg_Persp_Dif_Post_Pre_Short)/ Std_Persp_Dif_Post_Pre_Short;

display('Single Sample t: Perspective, intermittent group post - pre');
display(['Minter = ' num2str(Avg_Persp_Dif_Post_Pre_Short,3) ' +/- ' num2str(Std_Persp_Dif_Post_Pre_Short,3) ...
    ', t(' num2str(stats.df) ') = ' num2str(stats.tstat,3) ', p = ' num2str(p,3) ', d = ' num2str(d,3) ]);
display(' ');



display('**SLANT ADAPTATION FROM DISPARITY**');

%DISPARITY end - start
% continuous - One sample t test end - start
[h,p,ci,stats] = ttest(Disp_Dif_End_Start_Long);
d = (Avg_Disp_Dif_End_Start_Long)/ Std_Disp_Dif_End_Start_Long;

display('Single Sample t: Disparity, continuous group end - start');
display(['Mcont = ' num2str(Avg_Disp_Dif_End_Start_Long,3) ' +/- ' num2str(Std_Disp_Dif_End_Start_Long,3) ...
    ', t(' num2str(stats.df) ') = ' num2str(stats.tstat,3) ', p = ' num2str(p,3) ', d = ' num2str(d,3) ]);
display(' ');

% intermittent - One sample t test end - start
[h,p,ci,stats] = ttest(Disp_Dif_End_Start_Short);
d = (Avg_Disp_Dif_End_Start_Short)/ Std_Disp_Dif_End_Start_Short;

display('Single Sample t:Disparity, intermittent group end - start');
display(['Minter = ' num2str(Avg_Disp_Dif_End_Start_Short,3) ' +/- ' num2str(Std_Disp_Dif_End_Start_Short,3) ...
    ', t(' num2str(stats.df) ') = ' num2str(stats.tstat,3) ', p = ' num2str(p,3) ', d = ' num2str(d,3) ]);
display(' ');

%Unpaired T test
[h,p,ci,stats] = ttest2(Disp_Dif_End_Start_Long,Disp_Dif_End_Start_Short);
d = (Avg_Disp_Dif_End_Start_Long - Avg_Disp_Dif_End_Start_Short) / std([Disp_Dif_End_Start_Long;Disp_Dif_End_Start_Short]);

display('Single Sample t: Disparity, continuous compared to intermittent end - start');
display(['t(' num2str(stats.df) ') = ' num2str(stats.tstat,3) ', p = ' num2str(p,3) ', d = ' num2str(d,3) ]);
display(' ');

%DISPARITY  post - pre
% continuous - One sample t test post - pre
[h,p,ci,stats] = ttest(Disp_Dif_Post_Pre_Long);
d = (Avg_Disp_Dif_Post_Pre_Long)/ Std_Disp_Dif_Post_Pre_Long;

display('Single Sample t: Disparity, continuous group post - pre');
display(['Mcont = ' num2str(Avg_Disp_Dif_Post_Pre_Long,3) ' +/- ' num2str(Std_Disp_Dif_Post_Pre_Long,3) ...
    ', t(' num2str(stats.df) ') = ' num2str(stats.tstat,3) ', p = ' num2str(p,3) ', d = ' num2str(d,3) ]);
display(' ');

% intermittent - One sample t test post - pre
[h,p,ci,stats] = ttest(Disp_Dif_Post_Pre_Short);
d = (Avg_Disp_Dif_Post_Pre_Short)/ Std_Disp_Dif_Post_Pre_Short;

display('Single Sample t: Disparity, intermittent group post - pre');
display(['Minter = ' num2str(Avg_Disp_Dif_Post_Pre_Short,3) ' +/- ' num2str(Std_Disp_Dif_Post_Pre_Short,3) ...
    ', t(' num2str(stats.df) ') = ' num2str(stats.tstat,3) ', p = ' num2str(p,3) ', d = ' num2str(d,3) ]);
display(' ');

%Unpaired T test
[h,p,ci,stats] = ttest2(Disp_Dif_Post_Pre_Long,Disp_Dif_Post_Pre_Short);
d = (Avg_Disp_Dif_Post_Pre_Long - Avg_Disp_Dif_Post_Pre_Short) / std([Disp_Dif_Post_Pre_Long;Disp_Dif_Post_Pre_Short]);

display('unpaired t: Disparity, continuous compared to intermittent post - pre');
display(['t(' num2str(stats.df) ') = ' num2str(stats.tstat,3) ', p = ' num2str(p,3) ', d = ' num2str(d,3) ]);
display(' ');

%% PLOTTING

% set up some plotting variables
yticksSlant = [-6 -4 -2 0 2 4 6];

% y axis min and max for each row
ymin1 =-12;  ymax1 = 3.5;
ymin2 =-9.2; ymax2 = 5.5;
ymin3 =-4.5; ymax3 = 4;

% positions of corners of the red shaded box
x2              =[0,15]; %x length of rectangle
y4              =[0,0]; % bottom of rectangle
y5              =[6,6]; % top of rectangle

%Run function that makes the subplots close togeather
make_it_tight = true;
addpath './subtightplot/subtightplot'; %location of subtightplot script
subplot = @(m,n,p) subtightplot (m, n, p, [0.09 0.01], [0.1 0.01], [0.1 0.01]);
if ~make_it_tight,  clear subplot;  end

% open figure
f3 = figure; hold on;
f3.Position = [100 40 415 505];

counter = 0; 

% for each difference score Start vs pre, Start vs end, and Pre vs post
for dif = 1:3
    
    % for each condition (Persp,Disp,Dual)
    for cond = 1:length(condstr)
        
        counter = counter + 1;
        
        eval(['s',num2str(counter),'= subplot(3,3,',num2str(counter),'); hold on;']);
        
        %set parameters of plot
        if cond == 1 % perspective condition
            
            if counter == 1 %row 1 texture plot
                %draw arrow at expected bias. you will have to change it if you change the axes.
                title('Perspective-only');
                a = annotation('arrow',[0.11,0.1],[0.937,0.937]);
                a.Color = [1 0 0]; a.LineWidth = 1;
                xlim([xxmin, xxmax]); ylim([ymin1, ymax1]);
                s1 = set(gca, 'Xticklabel', []);
            elseif counter == 4 %second row
                II=patch([x2 fliplr(x2)],[y4 fliplr(y5)], 'r', 'LineStyle','none');II.FaceAlpha = alphared; %red shaded region to indicate adaptation
                ylabel('Difference (dg)');
                xlim([xxmin, xxmax]); ylim([ymin2, ymax2]);
                s4 = set(gca, 'Xticklabel', []); 
            elseif counter == 7
                II=patch([x2 fliplr(x2)],[y4 fliplr(y5)], 'r', 'LineStyle','none');
                II.FaceAlpha = alphared;
                xlim([xxmin, xxmax]); ylim([ymin3, ymax3]);
                xticklabels({'Continuous','Intermittent'});
            end
            
        elseif cond == 2 %disparity condition
            
            if counter == 2
                title('Disparity-only');
                s2 = set(gca, 'Yticklabel', [],'Xticklabel', []);
                a = annotation('arrow',[0.41,0.4011],[0.786 0.786]);
                a.Color = [1 0 0]; a.LineWidth = 1;
                xlim([xxmin, xxmax]); ylim([ymin1, ymax1]);
            elseif counter == 5
                II=patch([x2 fliplr(x2)],[y4 fliplr(y5)], 'r', 'LineStyle','none'); 
                II.FaceAlpha = alphared;
                s5 = set(gca, 'Yticklabel', [],'Xticklabel', []);
                xlim([xxmin, xxmax]); ylim([ymin2, ymax2]);
            elseif counter == 8
                II=patch([x2 fliplr(x2)],[y4 fliplr(y5)], 'r', 'LineStyle','none');
                II.FaceAlpha = alphared;
                s8 = set(gca, 'Yticklabel', []); 
                xticklabels({'Continuous','Intermittent'});
                xlim([xxmin, xxmax]); ylim([ymin3, ymax3]);
            end
            
        elseif cond == 3 %dual cue condition
            
            if counter == 3
                title('Dual cue');
                a = annotation('arrow',[0.71,0.7],[0.86 0.86]);
                a.Color = [1 0 0]; a.LineWidth = 1;
                s3 = set(gca, 'Yticklabel', [],'Xticklabel', []);
                xlim([xxmin, xxmax]); ylim([ymin1, ymax1]); 
            elseif counter == 6
                II=patch([x2 fliplr(x2)],[y4 fliplr(y5)], 'r', 'LineStyle','none'); 
                II.FaceAlpha = alphared;
                s6 = set(gca, 'Yticklabel', [],'Xticklabel', []); 
                xlim([xxmin, xxmax]); ylim([ymin2, ymax2]);
            elseif counter == 9
                II=patch([x2 fliplr(x2)],[y4 fliplr(y5)], 'r', 'LineStyle','none');
                II.FaceAlpha = alphared;
                s9 = set(gca, 'Yticklabel', [],'Xticklabel', []); 
                xticklabels({'Continuous','Intermittent'});
                xlim([xxmin, xxmax]); ylim([ymin3, ymax3]);
            end
            
        end
        
        % plot reference line
        hline = refline(0,0); hline.Color = 'k'; hline.LineStyle = '--';

        %PLOT THE DATA
        
        % for each group
        for group = 1:length(groupstr) %group (Long/Continuous, Short/Intermittent)
            
            % plot average within each subject
            eval(['scat = scatter(x_',groupstr{group},'_ind,',condstr{cond},'_',difstr{dif},'_',groupstr{group},...
                ',[MarkerSize3_small],"',shapestr{group},'","MarkerEdgeColor",color_lightgray);']); %raw data
            
            % calculate 95% CI across subjects
            eval(['CI_',condstr{cond},'_',difstr{dif},'_',groupstr{group},' = 1.96*(Std_',condstr{cond},'_',difstr{dif},'_',groupstr{group},'/sqrt(15));']); 
            
            eval(['Er = errorbar(xcondticks(group),Avg_',condstr{cond},'_',difstr{dif},'_',groupstr{group},...
                ',-(CI_',condstr{cond},'_',difstr{dif},'_',groupstr{group},'),CI_',condstr{cond},'_',difstr{dif},'_',...
                groupstr{group},'); Er.Color=[0 0 0]; Er.LineStyle = "none";']); %error bar
            
            Er.LineWidth = ErLineWidth;
            eval(['scatter(xcondticks(group),Avg_',condstr{cond},'_',difstr{dif},'_',groupstr{group}...
                ',[MarkerSize3],"',shapestr{group},'","MarkerFaceColor",',colorstr2{cond},',"MarkerEdgeColor",',colorstr2{cond},');']);%average
            
        end
        
        xticks(xcondticks);
        xtickangle(11);
        fig = gca;
        fig.TickLength = [0.015, 0.01];
        set(gca,'plotboxaspectratio',[1 1 1],'box','on','FontSize',fontsize,'fontname','arial');
    end 
    
end
hold off;
if make_it_tight,  clear subplot;  end

% save figure as a pdf
saveas(gcf,'../plots/fig_6_slant_biases.pdf');
