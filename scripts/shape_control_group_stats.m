%Stats reported in the "Shape control group" paragraph

close all;

%% Calculations

%calculate te difference scores for the control group in the shape condition
Shape_Dif_Start_Pre_Cont  = squeeze(nanmean(Shape(:,2,cont_inds)) - nanmean(Shape(:,1,cont_inds))); % start minus pre
Shape_Dif_End_Start_Cont  = squeeze(nanmean(Shape(:,3,cont_inds)) - nanmean(Shape(:,2,cont_inds))); % end minus start
Shape_Dif_Post_Pre_Cont   = squeeze(nanmean(Shape(:,4,cont_inds)) - nanmean(Shape(:,1,cont_inds))); % start minus pre

%calculate averages and Std
Avg_Shape_Dif_Start_Pre_Cont  = mean(Shape_Dif_Start_Pre_Cont);
Std_Shape_Dif_Start_Pre_Cont  = std(Shape_Dif_Start_Pre_Cont);
Avg_Shape_Dif_End_Start_Cont  = mean(Shape_Dif_End_Start_Cont); 
Std_Shape_Dif_End_Start_Cont  = std(Shape_Dif_End_Start_Cont); 
Avg_Shape_Dif_Post_Pre_Cont   = mean(Shape_Dif_Post_Pre_Cont); 
Std_Shape_Dif_Post_Pre_Cont   = std(Shape_Dif_Post_Pre_Cont);

%calculate 95% CI
CI_Shape_Dif_Start_Pre_Cont   = 1.96*Std_Shape_Dif_Start_Pre_Cont/sqrt(15); 
CI_Shape_Dif_End_Start_Cont   = 1.96*Std_Shape_Dif_End_Start_Cont/sqrt(15); 
CI_Shape_Dif_Post_Pre_Cont    = 1.96*Std_Shape_Dif_Post_Pre_Cont/sqrt(15); 

%% Stats

display('**INITIAL SHAPE DISTORTION - Control Group**');

%one sample t tests
%control group - one sample t test start-pre
[h,p,ci,stats] = ttest(Shape_Dif_Start_Pre_Cont);
 d = Avg_Shape_Dif_Start_Pre_Cont/ Std_Shape_Dif_Start_Pre_Cont;
 
display('Single Sample t: control group start-pre');
display(['M = ' num2str(Avg_Shape_Dif_Start_Pre_Cont,3) ' +/- ' num2str(Std_Shape_Dif_Start_Pre_Cont,3) ...
    ', t(' num2str(stats.df) ') = ' num2str(stats.tstat,3) ', p = ' num2str(p,3) ', d = ' num2str(d,3) ]);
display(' ');


display('**SHAPE ADAPTATION - Control**');
%one sample t tests
%control group - one sample t test end-start
[h,p,ci,stats] = ttest(Shape_Dif_End_Start_Cont);
 d = Avg_Shape_Dif_End_Start_Cont/ Std_Shape_Dif_End_Start_Cont;
 
display('Single Sample t: control group end-start');
display(['M = ' num2str(Avg_Shape_Dif_End_Start_Cont,3) ' +/- ' num2str(Std_Shape_Dif_End_Start_Cont,3) ...
    ', t(' num2str(stats.df) ') = ' num2str(stats.tstat,3) ', p = ' num2str(p,3) ', d = ' num2str(d,3) ]);
display(' ');


%unpaired t test 
[h,p,ci,stats] = ttest2(Shape_Dif_End_Start_Short,Shape_Dif_End_Start_Cont);
d = (Avg_Shape_Dif_End_Start_Short-Avg_Shape_Dif_End_Start_Cont)/ nanstd([Shape_Dif_End_Start_Short;Shape_Dif_End_Start_Cont]);
display('Unpaired t: shape difference between intermittent group & control end-start');
display(['t(' num2str(stats.df) ') = ' num2str(stats.tstat,3) ', p = ' num2str(p,3) ', d = ' num2str(d,3) ]);
display(' ');

display('**SHAPE AFTEREFFECT - Control**');

%control group - one sample t test post-pre
[h,p,ci,stats] = ttest(Shape_Dif_Post_Pre_Cont);
d = Avg_Shape_Dif_Post_Pre_Cont/ Std_Shape_Dif_Post_Pre_Cont;
 
display('Single Sample t: control group post-pre');
display(['M = ' num2str(Avg_Shape_Dif_Post_Pre_Cont,3) ' +/- ' num2str(Std_Shape_Dif_Post_Pre_Cont,3) ...
    ', t(' num2str(stats.df) ') = ' num2str(stats.tstat,3) ', p = ' num2str(p,3) ', d = ' num2str(d,3) ]);
display(' ');

%unpaired t test 
[h,p,ci,stats] = ttest2(Shape_Dif_Post_Pre_Short,Shape_Dif_Post_Pre_Cont);
d = (Avg_Shape_Dif_Post_Pre_Short-Avg_Shape_Dif_Post_Pre_Cont)/ nanstd([Shape_Dif_Post_Pre_Short;Shape_Dif_Post_Pre_Cont]);
display('Unpaired t: shape difference between intermittent group & control post-pre');
display(['t(' num2str(stats.df) ') = ' num2str(stats.tstat,3) ', p = ' num2str(p,3) ', d = ' num2str(d,3) ]);
display(' ');
