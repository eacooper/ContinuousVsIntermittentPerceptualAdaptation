% plot the slant and shape judgements at each time point for each subject in each group
%this figure is not in the paper

close all;

% separate figure for each group
fig_long    = figure; sgtitle('Continuous group');
fig_short   = figure; sgtitle('Intermittent group');
fig_control = figure; sgtitle('Control group');

% plot each subject as a line
for i = 1:length(SubjIDs)
    
    % determine the group and which figure to plot to
    switch Group{i}
        case 'long';    figure(fig_long); hold on;
        case 'short';   figure(fig_short); hold on;
        otherwise;      figure(fig_control); hold on;
    end
    
    %Perspective
    subplot(2,2,1); hold on; title('Perspective');
    plot(1:4,nanmean(Persp(:,:,i)),'-','color',color_01);
    hline = refline(0,0); hline.Color = 'k';
    set(gca,'xtick',[1:4],'xticklabel',{'Pre','Start','End','Post'});
    ylabel('Slant Perceived Frontoparallel (deg)');
    axis tight;
    
    %Disparity
    subplot(2,2,2); hold on; title('Disparity');
    plot(1:4,nanmean(Disp(:,:,i)),'color',color_02);
    hline = refline(0,0); hline.Color = 'k';
    set(gca,'xtick',[1:4],'xticklabel',{'Pre','Start','End','Post'});
    ylabel('Slant Perceived Frontoparallel (deg)');
    axis tight;
    
    %Dual Cue
    subplot(2,2,3); hold on; title('Dual Cue');
    plot(1:4,nanmean(Dual(:,:,i)),'color',color_03);
    hline = refline(0,0); hline.Color = 'k';
    set(gca,'xtick',[1:4],'xticklabel',{'Pre','Start','End','Post'});
    ylabel('Slant Perceived Frontoparallel (deg)');
    axis tight;
    
    %Rectangle Judgement
    subplot(2,2,4); hold on; title('Shape');
    plot(1:4,nanmean(Shape(:,:,i)),'color',color_04);
    hline = refline(0,1); hline.Color = 'k';
    set(gca,'xtick',[1:4],'xticklabel',{'Pre','Start','End','Post'});
    ylabel('Left-Right Ratio Perceived Square');
    axis tight;
    
    % store each subject's average for plotting the average of averages
    AvgPersp(1,:,i)     = nanmean(Persp(:,:,i));
    AvgDisp(1,:,i)      = nanmean(Disp(:,:,i));
    AvgDual(1,:,i)      = nanmean(Dual(:,:,i));
    AvgShape(1,:,i)     = nanmean(Shape(:,:,i));
        
    
end

% add in the average for each group

for g = 1:3
    
    if g == 1
        group_inds = find(strcmp(Group,'long'));
        figure(fig_long); hold on;
    elseif g == 2
        group_inds = find(strcmp(Group,'short'));
        figure(fig_short); hold on;
    else
        group_inds = find(strcmp(Group,'control'));
        figure(fig_control); hold on;
    end
    
    %perspective
    subplot(2,2,1); hold on;
    plot(1:4,nanmean(AvgPersp(1,:,group_inds),3),'o-','color','k','linewidth',2);
    
    subplot(2,2,2); hold on;
    plot(1:4,nanmean(AvgDisp(1,:,group_inds),3),'o-','color','k','linewidth',2);
    
    subplot(2,2,3); hold on;
    plot(1:4,nanmean(AvgDual(1,:,group_inds),3),'o-','color','k','linewidth',2);
    
    subplot(2,2,4); hold on;
    plot(1:4,nanmean(AvgShape(1,:,group_inds),3),'o-','color','k','linewidth',2);
    
end

% save each figure as a pdf
saveas(fig_long,'../plots/all_data_continuous_group.pdf');
saveas(fig_short,'../plots/all_data_intermittent_group.pdf');
saveas(fig_control,'../plots/all_data_control_group.pdf');
