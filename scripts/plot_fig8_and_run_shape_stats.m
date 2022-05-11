%Plots the shape difference scores from figure 8
close all;

%% Calculations

% calculate the difference scores for the shape condition
%continuous
Shape_Dif_Start_Pre_Long  = squeeze(nanmean(Shape(:,2,long_inds)) - nanmean(Shape(:,1,long_inds))); % start minus pre
Shape_Dif_End_Start_Long  = squeeze(nanmean(Shape(:,3,long_inds)) - nanmean(Shape(:,2,long_inds))); % end minus start
Shape_Dif_Post_Pre_Long   = squeeze(nanmean(Shape(:,4,long_inds)) - nanmean(Shape(:,1,long_inds))); % start minus pre
%intermittent
Shape_Dif_Start_Pre_Short  = squeeze(nanmean(Shape(:,2,short_inds)) - nanmean(Shape(:,1,short_inds))); % start minus pre
Shape_Dif_End_Start_Short  = squeeze(nanmean(Shape(:,3,short_inds)) - nanmean(Shape(:,2,short_inds))); % end minus start
Shape_Dif_Post_Pre_Short   = squeeze(nanmean(Shape(:,4,short_inds)) - nanmean(Shape(:,1,short_inds))); % start minus pre

%calculate Averages  & Std
%continuous
Avg_Shape_Dif_Start_Pre_Long  = mean(Shape_Dif_Start_Pre_Long);
Std_Shape_Dif_Start_Pre_Long  = std(Shape_Dif_Start_Pre_Long);
Avg_Shape_Dif_End_Start_Long  = mean(Shape_Dif_End_Start_Long); 
Std_Shape_Dif_End_Start_Long  = std(Shape_Dif_End_Start_Long); 
Avg_Shape_Dif_Post_Pre_Long   = mean(Shape_Dif_Post_Pre_Long); 
Std_Shape_Dif_Post_Pre_Long   = std(Shape_Dif_Post_Pre_Long);
%intermittent
Avg_Shape_Dif_Start_Pre_Short  = mean(Shape_Dif_Start_Pre_Short);
Std_Shape_Dif_Start_Pre_Short  = std(Shape_Dif_Start_Pre_Short);
Avg_Shape_Dif_End_Start_Short  = mean(Shape_Dif_End_Start_Short); 
Std_Shape_Dif_End_Start_Short  = std(Shape_Dif_End_Start_Short); 
Avg_Shape_Dif_Post_Pre_Short   = mean(Shape_Dif_Post_Pre_Short); 
Std_Shape_Dif_Post_Pre_Short   = std(Shape_Dif_Post_Pre_Short);

%calculate 95% CI
%continuous
CI_Shape_Dif_Start_Pre_Long   = 1.96*Std_Shape_Dif_Start_Pre_Long/sqrt(15); 
CI_Shape_Dif_End_Start_Long   = 1.96*Std_Shape_Dif_End_Start_Long/sqrt(15); 
CI_Shape_Dif_Post_Pre_Long    = 1.96*Std_Shape_Dif_Post_Pre_Long/sqrt(15); 
%intermittent
CI_Shape_Dif_Start_Pre_Short   = 1.96*Std_Shape_Dif_Start_Pre_Short/sqrt(15); 
CI_Shape_Dif_End_Start_Short   = 1.96*Std_Shape_Dif_End_Start_Short/sqrt(15); 
CI_Shape_Dif_Post_Pre_Short    = 1.96*Std_Shape_Dif_Post_Pre_Short/sqrt(15); 



%% Stats

display('**INITIAL SHAPE DISTORTION**');

%one sample t tests
%continuous - one sample t test start-pre
[h,p,ci,stats] = ttest(Shape_Dif_Start_Pre_Long);
 d = Avg_Shape_Dif_Start_Pre_Long/ Std_Shape_Dif_Start_Pre_Long;
 
display('Single Sample t: continuous group start-pre');
display(['Mcont = ' num2str(Avg_Shape_Dif_Start_Pre_Long,3) ' +/- ' num2str(Std_Shape_Dif_Start_Pre_Long,3) ...
    ', t(' num2str(stats.df) ') = ' num2str(stats.tstat,3) ', p = ' num2str(p,3) ', d = ' num2str(d,3) ]);
display(' ');

%intermittent - one sample t test start-pre
[h,p,ci,stats] = ttest(Shape_Dif_Start_Pre_Short);
 d = Avg_Shape_Dif_Start_Pre_Short/ Std_Shape_Dif_Start_Pre_Short;
 
display('Single Sample t: intermittent group start-pre');
display(['Mcont = ' num2str(Avg_Shape_Dif_Start_Pre_Short,3) ' +/- ' num2str(Std_Shape_Dif_Start_Pre_Short,3) ...
    ', t(' num2str(stats.df) ') = ' num2str(stats.tstat,3) ', p = ' num2str(p,3) ', d = ' num2str(d,3) ]);
display(' ');


display('**SHAPE ADAPTATION**');

%continuous - one sample t test end-start
[h,p,ci,stats] = ttest(Shape_Dif_End_Start_Long);
 d = Avg_Shape_Dif_End_Start_Long/ Std_Shape_Dif_End_Start_Long;
 
display('Single Sample t: continuous group end-start');
display(['Mcont = ' num2str(Avg_Shape_Dif_End_Start_Long,3) ' +/- ' num2str(Std_Shape_Dif_End_Start_Long,3) ...
    ', t(' num2str(stats.df) ') = ' num2str(stats.tstat,3) ', p = ' num2str(p,3) ', d = ' num2str(d,3) ]);
display(' ');

%intermittent - one sample t test end-start
[h,p,ci,stats] = ttest(Shape_Dif_End_Start_Short);
 d = Avg_Shape_Dif_End_Start_Short/ Std_Shape_Dif_End_Start_Short;
 
display('Single Sample t: intermittent group end-start');
display(['Mcont = ' num2str(Avg_Shape_Dif_End_Start_Short,3) ' +/- ' num2str(Std_Shape_Dif_End_Start_Short,3) ...
    ', t(' num2str(stats.df) ') = ' num2str(stats.tstat,3) ', p = ' num2str(p,3) ', d = ' num2str(d,3) ]);
display(' ');

%Unpaired t test
%intermittent and continuous groups
[h,p,ci,stats] = ttest2(Shape_Dif_End_Start_Long,Shape_Dif_End_Start_Short);
d = (Avg_Shape_Dif_End_Start_Long-Avg_Shape_Dif_End_Start_Short)/ nanstd([Shape_Dif_End_Start_Long;Shape_Dif_End_Start_Short]);
display('Unpaired t: Shape dif b/w intermittent group & continuous end-start');
display(['t(' num2str(stats.df) ') = ' num2str(stats.tstat,3) ', p = ' num2str(p,3) ', d = ' num2str(d,3) ]);
display(' ');


%continuous - one sample t test post-pre
[h,p,ci,stats] = ttest(Shape_Dif_Post_Pre_Long);
 d = Avg_Shape_Dif_Post_Pre_Long/ Std_Shape_Dif_Post_Pre_Long;
 
display('Single Sample t: continuous group post-pre');
display(['Mcont = ' num2str(Avg_Shape_Dif_Post_Pre_Long,3) ' +/- ' num2str(Std_Shape_Dif_Post_Pre_Long,3) ...
    ', t(' num2str(stats.df) ') = ' num2str(stats.tstat,3) ', p = ' num2str(p,3) ', d = ' num2str(d,3) ]);
display(' ');

%intermittent - one sample t test post-pre
[h,p,ci,stats] = ttest(Shape_Dif_Post_Pre_Short);
 d = Avg_Shape_Dif_Post_Pre_Short/ Std_Shape_Dif_Post_Pre_Short;
 
display('Single Sample t: intermittent group post-pre');
display(['Mcont = ' num2str(Avg_Shape_Dif_Post_Pre_Short,3) ' +/- ' num2str(Std_Shape_Dif_Post_Pre_Short,3) ...
    ', t(' num2str(stats.df) ') = ' num2str(stats.tstat,3) ', p = ' num2str(p,3) ', d = ' num2str(d,3) ]);
display(' ');
    
%Unpaired t test
%intermittent and continuous groups
[h,p,ci,stats] = ttest2(Shape_Dif_Post_Pre_Long,Shape_Dif_Post_Pre_Short);
d = (Avg_Shape_Dif_Post_Pre_Long-Avg_Shape_Dif_Post_Pre_Short)/ nanstd([Shape_Dif_Post_Pre_Long;Shape_Dif_Post_Pre_Short]);
display('Unpaired t: Sintermittent group & continuous end-start');
display(['t(' num2str(stats.df) ') = ' num2str(stats.tstat,3) ', p = ' num2str(p,3) ', d = ' num2str(d,3) ]);
display(' ');


%% Plot

%positions of corrners of the red shaded box
x2  = ([0,15]); %x length of rectangle
y4  = [0,0];    % bottom of rectangle
y5  = [6,6];    % top of rectangle 

%yvalues for different rows
ymin1 = -0.051; ymax1 = 0.02; 
ymin2 = -0.023; ymax2 = 0.029; 
ymin3 = -0.023; ymax3 = 0.029;

%Run function that makes the subplots close togeather
make_it_tight = true;
addpath './subtightplot/subtightplot'; %location of subtightplot script
subplot = @(m,n,p) subtightplot (m, n, p, [0.09 2], [0.1 0.01], [0.3 0.05]);
if ~make_it_tight,  clear subplot;  end

counter = 0;

f2 = figure;
f2.Position = [100 40 415 505];
for dif = 1:3 %Loop through the difference calculations Start vs pre, Start vs end, and Pre vs post
    
        counter = counter + 1;
        
        eval(['s',num2str(counter),'= subplot(3,1,',num2str(counter),'); hold on;']); %allows us a new name for each subplot
        
        %set parameters of plot
        if counter == 1 
            %draw arrow at expected bias. you will have to change it if you change the axes.
            a = annotation('arrow',[0.49,0.48],[0.769 0.769]); 
            a.Color = [1 0 0]; a.LineWidth = 1;
            xlim([xxmin, xxmax]); ylim([ymin1,ymax1]);
            s1 = set(gca, 'Xticklabel', []);
            hline = refline(0,0); hline.Color = 'k'; hline.LineStyle = '--';
        elseif counter == 2
            II=patch([x2 fliplr(x2)],[y4 fliplr(y5)], 'r', 'LineStyle','none');II.FaceAlpha = alphared; %red shaded region to indicate adaptation
            xlim([xxmin, xxmax]); ylim([ymin2,ymax2]);
            s1 = set(gca, 'Xticklabel', []);
            ylabel('Difference in ratios');
            hline = refline(0,0); hline.Color = 'k'; hline.LineStyle = '--';
        elseif counter == 3
            II=patch([x2 fliplr(x2)],[y4 fliplr(y5)], 'r', 'LineStyle','none');II.FaceAlpha = alphared; 
            xticklabels({'Continuous','Intermittent'});
            xlim([xxmin, xxmax]); ylim([ymin3,ymax3]);
            hline = refline(0,0); hline.Color = 'k'; hline.LineStyle = '--';
        end

        
        %plot the data
        for group = 1:length(groupstr) %group loop (Long/continuous, Short/intermitent)
            eval(['scatter(x_',groupstr{group},'_ind,Shape_',difstr{dif},'_',groupstr{group},...
                ',[MarkerSize3_small],"',shapestr{group},'","MarkerEdgeColor",color_lightgray);']); %individual data
            eval(['Er = errorbar(xcondticks(group),Avg_Shape_',difstr{dif},'_',groupstr{group},...
                ',-(CI_Shape_',difstr{dif},'_',groupstr{group},'),CI_Shape_',difstr{dif},...
                '_',groupstr{group},'); Er.Color=[0 0 0]; Er.LineStyle = "none";']); %error bar
            Er.LineWidth = ErLineWidth;
            eval(['scatter(xcondticks(group),Avg_Shape_',difstr{dif},'_',groupstr{group},...
                ',[MarkerSize3],"',shapestr{group},'","MarkerFaceColor",color_04,"MarkerEdgeColor",color_04);']);%average
        end
        xticks(xcondticks);
        xtickangle(11);

        fig = gca;
        fig.TickLength = [0.015, 0.01];
        set(gca,'box','on','FontSize',fontsize,'fontname','arial');
        set(gca,'plotboxaspectratio',[1 1 1],'box','on','FontSize',fontsize,'fontname','arial');

    
end
hold off;

 % save figure as a pdf
saveas(gcf,'../plots/fig_8_shape.pdf');
