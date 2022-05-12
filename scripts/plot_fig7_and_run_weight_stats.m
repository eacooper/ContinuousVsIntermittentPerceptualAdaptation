%This script plots figure 7 and calculates the disparity and perspective
%weight.

close all;

% use cue combination model to calculate the weight given to disparity at start
% adapt and end adapt

for Subj = 1:length(SubjIDs) % for each subject
    
    % calcuate the mean slant setting in the start and end adapt conditions
    %start adapt
    Persp_Start(Subj)    = nanmean(Persp(:,2,Subj));
    Disp_Start(Subj)     = nanmean(Disp(:,2,Subj));
    Dual_Start(Subj)     = nanmean(Dual(:,2,Subj));
    
    %end adapt
    Persp_End(Subj)      = nanmean(Persp(:,3,Subj));
    Disp_End(Subj)       = nanmean(Disp(:,3,Subj));
    Dual_End(Subj)       = nanmean(Dual(:,3,Subj));
    
    % apply correction to perspective cue
    % we use the IPD to correct the perceived direction bias from
    % monocular viewing in the perspective-only condition.
    % Specifically, the perspective condition is monocular (left eye) so we can assume that people
    % were adjusting the stimulus so that it looks fronto-parallel to the left
    % eye. The slant that would look fronto-parallel to the left is is
    % equivalent to half the vergence angel
    halfipd               = ipds(Subj)/2;
    half_verg_angle       = -(atan(halfipd/0.2930) * (180/pi));
    
    Persp_Start_unb(Subj) = Persp_Start(Subj) - half_verg_angle;
    Persp_End_unb(Subj)   = Persp_End(Subj) - half_verg_angle;
    
    Wd_start(Subj)        = (Persp_Start_unb(Subj) - Dual_Start(Subj)) / (Persp_Start_unb(Subj) - Disp_Start(Subj));
    Wd_end(Subj)          = (Persp_End_unb(Subj) - Dual_End(Subj)) / (Persp_End_unb(Subj) - Disp_End(Subj));
    
    %This is used to double check some of our assumptions. These values are not used in the paper.
    Persp_Pre(Subj)     = nanmean(Persp(:,1,Subj));
    Disp_Pre(Subj)      = nanmean(Disp(:,1,Subj));
    Dual_Pre(Subj)      = nanmean(Dual(:,1,Subj));
    
    Persp_Pre_unb(Subj) = Persp_Pre(Subj) - half_verg_angle;
    
    Wd_start_2(Subj)    = (Dual_Pre(Subj) - Dual_Start(Subj) - Persp_Pre(Subj) + Persp_Start(Subj)) / (Disp_Pre(Subj) - Disp_Start(Subj) - Persp_Pre(Subj) + Persp_Start(Subj));
    
    
end


%REMOVE PARTICIPANTS WHO DO NOT FIT THE MODEL
% find indices of people who dont fit model
exc_inds = Wd_start < 0 | Wd_end < 0 | Wd_start > 1 | Wd_end > 1;

% set these indices to NaNs
Wd_start(exc_inds) = NaN;
Wd_end(exc_inds) = NaN;

% count and report number of excluded people from each group
display(['Long group weights excluded = ' num2str(sum(isnan(Wd_start(long_inds)))) ]);
display(['Short group weights excluded = ' num2str(sum(isnan(Wd_start(short_inds)))) ]);

%calculate weight differences
Wd_Dif_End_Start_Long  = Wd_end(long_inds) - Wd_start(long_inds);
Wd_Dif_End_Start_Short = Wd_end(short_inds) - Wd_start(short_inds);

% calculate the Wd mean, difference mean, std and 95% CI of weights for each group
Avg_Wd_start_Long  = nanmean(Wd_start(long_inds));
Avg_Wd_end_Long    = nanmean(Wd_end(long_inds));
Dif_Avg_Wd_Long    = nanmean(Wd_end(long_inds) - Wd_start(long_inds));

Avg_Wd_start_Short = nanmean(Wd_start(short_inds));
Avg_Wd_end_Short   = nanmean(Wd_end(short_inds));
Dif_Avg_Wd_Short   = nanmean(Wd_end(short_inds) - Wd_start(short_inds));

Std_Wd_start_Long = nanstd(Wd_start(long_inds));
Std_Wd_end_Long   = nanstd(Wd_end(long_inds));
Dif_Std_Wd_Long   = nanstd(Wd_end(long_inds) - Wd_start(long_inds));

Std_Wd_start_Short = nanstd(Wd_start(short_inds));
Std_Wd_end_Short   = nanstd(Wd_end(short_inds));
Dif_Std_Wd_Short   = nanstd(Wd_end(short_inds) - Wd_start(short_inds));

CI_Wd_start_Long   = 1.96*Std_Wd_start_Long/sqrt(sum(~isnan(Wd_start(long_inds))));
CI_Wd_end_Long     = 1.96*Std_Wd_end_Long/sqrt(sum(~isnan(Wd_start(long_inds))));
Dif_CI_Wd_Long     = 1.96*Dif_Std_Wd_Long/sqrt(sum(~isnan(Wd_start(long_inds))));

CI_Wd_start_Short  = 1.96*Std_Wd_start_Short/sqrt(sum(~isnan(Wd_start(short_inds))));
CI_Wd_end_Short    = 1.96*Std_Wd_end_Short/sqrt(sum(~isnan(Wd_start(short_inds))));
Dif_CI_Wd_Short    = 1.96*Dif_Std_Wd_Short/sqrt(sum(~isnan(Wd_start(short_inds))));


%% RUN STATS

display('**WEIGHT STATS**');

%continuous - single sample t-test end-start
[h,p,ci,stats] = ttest(Wd_Dif_End_Start_Long);
d = Dif_Avg_Wd_Long/ Dif_Std_Wd_Long;

display('Single Sample t: Weight Difference continuous group end-start');
display(['Mcont = ' num2str(Dif_Avg_Wd_Long,3) ' +/- ' num2str(Dif_Std_Wd_Long,3) ...
    ', t(' num2str(stats.df) ') = ' num2str(stats.tstat,3) ', p = ' num2str(p,3) ', d = ' num2str(d,3) ]);
display(' ');

%intermittent - single sample t-test end-start
[h,p,ci,stats] = ttest(Wd_Dif_End_Start_Short);
d = Dif_Avg_Wd_Short/ Dif_Std_Wd_Short;

display('Single Sample t: Weight Difference intermittent group end-start');
display(['Minter = ' num2str(Dif_Avg_Wd_Short,3) ' +/- ' num2str(Dif_Std_Wd_Short,3) ...
    ', t(' num2str(stats.df) ') = ' num2str(stats.tstat,3) ', p = ' num2str(p,3) ', d = ' num2str(d,3) ]);
display(' ');


%Unpaired t test for the difference scores for the comparison between
%intermittent and continuous groups
[h,p,ci,stats] = ttest2(Wd_Dif_End_Start_Long,Wd_Dif_End_Start_Short);
d = (Dif_Avg_Wd_Long-Dif_Avg_Wd_Short)/ std([Dif_Avg_Wd_Short;Dif_Avg_Wd_Long]);
display('Unpaired t: Shape Adaptation intermittent group & continuous end-start');
display(['t(' num2str(stats.df) ') = ' num2str(stats.tstat,3) ', p = ' num2str(p,3) ', d = ' num2str(d,3) ]);
display(' ');



%% Plotting

% plotting set up
xcondticks  = [1 1.5];

%Run function that makes the subplots close togeather
make_it_tight = true;
addpath './subtightplot/subtightplot'; %location of subtightplot script
subplot = @(m,n,p) subtightplot (m, n, p, [0.15 0.01], [0.1 0.05], [0.3 0.05]);
if ~make_it_tight,  clear subplot;  end

subplotnum = 3;

figure; hold on;

for nplot = 1:subplotnum
    
    if nplot == 1
        
        %PLOTTING WEIGHT AT START & END
        
        s1  = subplot(2,2,nplot); hold on;
        
        plot(xcondticks,[Wd_start(long_inds) ; Wd_end(long_inds)]','color',color_lightgray);
        avg = plot(xcondticks,[Avg_Wd_start_Long Avg_Wd_end_Long],'k-o','MarkerFaceColor','k'); hold on; avg(1).MarkerSize= 8;
        Er  = errorbar(xcondticks,[Avg_Wd_start_Long Avg_Wd_end_Long],-([CI_Wd_start_Long CI_Wd_end_Long]),[CI_Wd_start_Long CI_Wd_end_Long]); Er.Color=[0 0 0]; Er.LineStyle = 'none';Er.LineWidth = ErLineWidth;
        
        
    elseif nplot == 2
        
        s2  = subplot(2,2,nplot); hold on;
        
        plot(xcondticks,[Wd_start(short_inds) ; Wd_end(short_inds)]','color',color_lightgray);
        avg = plot(xcondticks,[Avg_Wd_start_Short Avg_Wd_end_Short],'k-d','MarkerFaceColor','k'); hold on; avg(1).MarkerSize= 8;
        Er  = errorbar(xcondticks,[Avg_Wd_start_Short Avg_Wd_end_Short],-([CI_Wd_start_Short CI_Wd_end_Short]),[CI_Wd_start_Short CI_Wd_end_Short]); Er.Color=[0 0 0]; Er.LineStyle = 'none';Er.LineWidth = ErLineWidth;
        
    elseif nplot == 3
        
        %DIFFERENCE B/W START & END ADAPT
        subplot(2,2,nplot); hold on;
        %long
        avg   = plot(xcondticks(1,1),Dif_Avg_Wd_Long,'k-o','MarkerFaceColor','k'); avg(1).MarkerSize= 8;
        Er    = errorbar(xcondticks(1,1),Dif_Avg_Wd_Long,-(Dif_CI_Wd_Long),Dif_CI_Wd_Long); Er.Color=[0 0 0]; Er.LineStyle = 'none'; Er.LineWidth = ErLineWidth;
        %short
        avg   = plot(xcondticks(1,2),Dif_Avg_Wd_Short,'k-d','MarkerFaceColor','k');avg(1).MarkerSize= 8;
        Er    = errorbar(xcondticks(1,2),Dif_Avg_Wd_Short,-(Dif_CI_Wd_Short),Dif_CI_Wd_Short); Er.Color=[0 0 0]; Er.LineStyle = 'none';Er.LineWidth = ErLineWidth;
        
        %line at zero
        hline = refline(0,0); hline.Color = 'k'; hline.LineStyle = '--';
    end
    
    
    
    %AXIS PARAMETERS
    if nplot == 1
        xticks(xcondticks);
        xticklabels({'\bfStart\newlineAdapt','\bfEnd\newlineAdapt'});
        ylabel('Disparity Weight (Wd)');
        xlim([xxmin, 1.8]);
        hline = refline(0,0.5); hline.Color = 'k';
    elseif nplot == 2
        xticks(xcondticks);
        xticklabels({'\bfStart\newlineAdapt','\bfEnd\newlineAdapt'});
        xlim([xxmin, 1.8]);
        s1 = set(gca, 'Yticklabel', []);
        hline = refline(0,0.5); hline.Color = 'k';
    elseif nplot == 3
        ylim([-0.1, 0.43]);
        ylabel('Disparity Weight Differnce');
        xticks(xcondticks);
        xtickangle(11);
        xticklabels({'Continuous','Intermittent'});
        xlim([xxmin, 1.8]);
    end
    
    fig = gca;
    fig.TickLength = [0.015, 0.01];
    set(gca,'box','on','FontSize',fontsize,'fontname','arial');
    
    
end
hold off;
if make_it_tight,  clear subplot;  end

% save figure as a pdf
saveas(gcf,'../plots/fig_7_weight.pdf');
