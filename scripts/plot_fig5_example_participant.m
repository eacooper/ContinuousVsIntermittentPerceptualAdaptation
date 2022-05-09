% plot figure 5 - example data and difference scores from one subject in the disparity condition

close all;

% set up some plotting variables
MarkerSize2         = 60;
MarkerSize_small    = MarkerSize2 * 0.4;
fontsize2           = 11;
MarkerSizeP2        = MarkerSize2 * 0.1400;
Linewidth           = 2;
x_coords            = [0.4 2.1 4.2 5.8];

% which subject to plot
Sind = 2;


figure; hold on;
subplot(1,2,1); hold on;

% plot lines connecting averages
plot(x_coords(1:2),nanmean(Disp(:,1:2,Sind)),'-','Color',color_01,'LineWidth',Linewidth);
plot(x_coords(2:3),nanmean(Disp(:,2:3,Sind)),'-','Color',color_02,'LineWidth',Linewidth);
plot(x_coords([1 4]),nanmean(Disp(:,[1 4],Sind)),'-','Color',color_03,'LineWidth',Linewidth);

%plot each trial
data = scatter(repelem(x_coords,30), reshape(Disp(:,:,Sind),1,numel(Disp(:,:,Sind))),MarkerSize_small,'^','MarkerEdgeColor',color_lightgray);

% plot a marker for each average
Avg = plot(x_coords, nanmean(Disp(:,:,Sind)),'k^','MarkerFaceColor','k','MarkerEdgeColor','k'); Avg(1).MarkerSize= MarkerSizeP2; 

% plot zero reference line
hline = refline(0,0); hline.Color = 'k'; hline.LineStyle = '--';
hline = refline(0,-9.83); hline.Color = 'r'; hline.LineStyle = '--';

xlim([-0.4 10]);
ylim([-15 5]);
ylabel('Slant Percieved Fronto-Parallel (deg)');
xticks(x_coords); 
xticklabels({'\bfPre','\bfStart\newlineAdapt','\bfEnd\newlineAdapt','\bfPost'});

legend([data Avg],'One Response','Average Response','Location','northwest');
legend boxoff;
text(7.2,0,'Frontoparallel');
text(7.2,-9.83,'Expected Slant Bias','Color','red');
set(gca,'plotboxaspectratio',[1.3 1 1],'box','off','FontSize',fontsize2);


%Disparity difference plot
%calculate the differences 
Disp_Dif_Start_Pre  = nanmean(Disp(:,2,Sind)) - nanmean(Disp(:,1,Sind)); % start minus pre
Disp_Dif_End_Start  = nanmean(Disp(:,3,Sind)) - nanmean(Disp(:,2,Sind)); % end minus start
Disp_Dif_Post_Pre   = nanmean(Disp(:,4,Sind)) - nanmean(Disp(:,1,Sind)); % start minus pre

%plot differences
subplot(1,2,2); hold on;
scatter([0.40,2.1,3.8],[Disp_Dif_Start_Pre,Disp_Dif_End_Start,Disp_Dif_Post_Pre],MarkerSize2,'o','MarkerFaceColor','k','MarkerEdgeColor','k');

%plot zero reference line
hline = refline(0,0); hline.Color = 'k';

xlim([-0.4 4.8]);
ylim([-14 5]);
ylabel({'Difference (deg)'});
xticks([0.40,2.1,3.8]);
xticklabels({'\bfInitial Bias\newline(Start-Pre)','\bfAdaptation\newline(End - Start)',...
    '\bfAftereffect\newline(Post - Pre)'});
xtickangle(10);
set(gca,'plotboxaspectratio',[1.3 1 1],'box','off','FontSize',fontsize2);

% save figure as a pdf
saveas(gcf,'../plots/fig_5_example_participant.pdf');

