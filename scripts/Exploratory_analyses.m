%Exploritory Analysis reported in Discussion
close all;


% Correction To Perspective Data
% the perspective condition is monocular (left eye). We assume that people
% adjust the stimulus so that it looks fronto-parallel to the left
% eye. The slant that would look fronto-parallel to the left is
% equivalent to half the vergence angle. We subtract this bias from thier
% perspective slant estimates
for Subj = 1:length(SubjIDs)
    
    halfipd = ipds(Subj)/2;
    half_verg_angle = -(atan(halfipd/0.2930) * (180/pi));
    
    Persp_unb(:,:,Subj) = Persp(:,:,Subj) - half_verg_angle;
    
end


%% Calculations for Correlation
%disparity
Disp_Dif_Start_Pre_Long   = squeeze(nanmean(Disp(:,2,long_inds)) - nanmean(Disp(:,1,long_inds))); % start minus pre
Disp_Dif_End_Start_Long   = squeeze(nanmean(Disp(:,3,long_inds)) - nanmean(Disp(:,2,long_inds))); % end minus start
Disp_Dif_Post_Pre_Long    = squeeze(nanmean(Disp(:,4,long_inds)) - nanmean(Disp(:,1,long_inds))); % start minus pre

Disp_Dif_Start_Pre_Short  = squeeze(nanmean(Disp(:,2,short_inds)) - nanmean(Disp(:,1,short_inds))); % start minus pre
Disp_Dif_End_Start_Short  = squeeze(nanmean(Disp(:,3,short_inds)) - nanmean(Disp(:,2,short_inds))); % end minus start
Disp_Dif_Post_Pre_Short   = squeeze(nanmean(Disp(:,4,short_inds)) - nanmean(Disp(:,1,short_inds))); % start minus pre

%Dual cue differences for each group
Dual_Dif_Start_Pre_Long   = squeeze(nanmean(Dual(:,2,long_inds)) - nanmean(Dual(:,1,long_inds))); % start minus pre
Dual_Dif_End_Start_Long   = squeeze(nanmean(Dual(:,3,long_inds)) - nanmean(Dual(:,2,long_inds))); % end minus start
Dual_Dif_Post_Pre_Long    = squeeze(nanmean(Dual(:,4,long_inds)) - nanmean(Dual(:,1,long_inds))); % start minus pre

Dual_Dif_Start_Pre_Short  = squeeze(nanmean(Dual(:,2,short_inds)) - nanmean(Dual(:,1,short_inds))); % start minus pre
Dual_Dif_End_Start_Short  = squeeze(nanmean(Dual(:,3,short_inds)) - nanmean(Dual(:,2,short_inds))); % end minus start
Dual_Dif_Post_Pre_Short   = squeeze(nanmean(Dual(:,4,short_inds)) - nanmean(Dual(:,1,short_inds))); % start minus pre

%shape
Shape_Dif_Start_Pre_Long  = squeeze(nanmean(Shape(:,2,long_inds)) - nanmean(Shape(:,1,long_inds))); % start minus pre
Shape_Dif_End_Start_Long  = squeeze(nanmean(Shape(:,3,long_inds)) - nanmean(Shape(:,2,long_inds))); % end minus start
Shape_Dif_Post_Pre_Long   = squeeze(nanmean(Shape(:,4,long_inds)) - nanmean(Shape(:,1,long_inds))); % start minus pre

Shape_Dif_Start_Pre_Short = squeeze(nanmean(Shape(:,2,short_inds)) - nanmean(Shape(:,1,short_inds))); % start minus pre
Shape_Dif_End_Start_Short = squeeze(nanmean(Shape(:,3,short_inds)) - nanmean(Shape(:,2,short_inds))); % end minus start
Shape_Dif_Post_Pre_Short  = squeeze(nanmean(Shape(:,4,short_inds)) - nanmean(Shape(:,1,short_inds))); % start minus pre


%STATS
%Correlation between adaptation to the slant distortion from disparity
%and the shape distortion

display('**SLANT & DUAL CUE INITIAL DISTORTION**');
%continuous group
[r,p,~,~] = corrcoef(Disp_Dif_Start_Pre_Long,Dual_Dif_Start_Pre_Long);
display('continuous: Slant from Disparity & dual cue start-pre');
display(['r = ' num2str(r(2),3),', p = ' num2str(p(2),4)]);
display(' ');

%intermittent group
[r,p] = corrcoef(Disp_Dif_Start_Pre_Short,Dual_Dif_Start_Pre_Short);
display('intermittent: Slant from Disparity & dual cue start-pre');
display(['r = ' num2str(r(2),3),', p = ' num2str(p(2),4)]);
display(' ');

%both groups
[r,p] = corrcoef([Disp_Dif_Start_Pre_Long ; Disp_Dif_Start_Pre_Short],[Dual_Dif_Start_Pre_Long ; Dual_Dif_Start_Pre_Short]);
display('both groups: Slant from Disparity & dual cue start-pre');
display(['r = ' num2str(r(2),3),', p = ' num2str(p(2),4)]);
display(' ');


display('**SLANT & DUAL CUE ADAPTATION**');
%continuous group
[r,p,~,~] = corrcoef(Disp_Dif_End_Start_Long,Dual_Dif_End_Start_Long);
display('continuous: Slant from Disparity & dual cue Adaptation end-start');
display(['r = ' num2str(r(2),3),', p = ' num2str(p(2),3)]);
display(' ');

%intermittent group
[r,p] = corrcoef(Disp_Dif_End_Start_Short,Dual_Dif_End_Start_Short);
display('intermittent: Slant from Disparity & dual cue Adaptation end-start');
display(['r = ' num2str(r(2),3),', p = ' num2str(p(2),4)]);
display(' ');

%both groups
[r,p] = corrcoef([Disp_Dif_End_Start_Short Disp_Dif_End_Start_Long],[Dual_Dif_End_Start_Short Dual_Dif_End_Start_Long]);
display('both groups: Slant from Disparity & dual cue Adaptation end-start');
display(['r = ' num2str(r(2),3),', p = ' num2str(p(2),4)]);
display(' ');



display('**SLANT & DUAL CUE AFTEREFFECT**');
%continuous group
[r,p,~,~] = corrcoef(Disp_Dif_Post_Pre_Long,Dual_Dif_Post_Pre_Long);
display('continuous: Slant from Disparity & dual cue post-pre');
display(['r = ' num2str(r(2),3),', p = ' num2str(p(2),4)]);
display(' ');

%intermittent group
[r,p] = corrcoef(Disp_Dif_Post_Pre_Short,Dual_Dif_Post_Pre_Short);
display('intermittent: Slant from Disparity & Shape post-pre');
display(['r = ' num2str(r(2),3),', p = ' num2str(p(2),4)]);
display(' ');

%both groups
[r,p] = corrcoef([Disp_Dif_Post_Pre_Short Disp_Dif_Post_Pre_Long],[Dual_Dif_Post_Pre_Short Dual_Dif_Post_Pre_Long]);
display('both groups: Slant from Disparity & dual cue Adaptation post-pre');
display(['r = ' num2str(r(2),3),', p = ' num2str(p(2),4)]);
display(' ');



display('**SLANT & SHAPE INITIAL DISTORTION**');

%Shape vs Disparity start-pre
%continuous group
[r,p,~,~] = corrcoef(Disp_Dif_Start_Pre_Long,Shape_Dif_Start_Pre_Long);
display('continuous: Slant from Disparity & Shape start-pre');
display(['r = ' num2str(r(2),3),', p = ' num2str(p(2),4)]);
display(' ');

%intermittent group
[r,p] = corrcoef(Disp_Dif_Start_Pre_Short,Shape_Dif_Start_Pre_Short);
display('intermittent: Slant from Disparity & Shape start-pre');
display(['r = ' num2str(r(2),3),', p = ' num2str(p(2),4)]);
display(' ');

%both groups
[r,p] = corrcoef([Disp_Dif_Start_Pre_Short ; Disp_Dif_Start_Pre_Long],[Shape_Dif_Start_Pre_Short Shape_Dif_Start_Pre_Long]);
display('both: Slant from Disparity & Shape start-pre');
display(['r = ' num2str(r(2),3),', p = ' num2str(p(2),4)]);
display(' ');




display('**SLANT & SHAPE ADAPTATION**');

%continuous group
[r,p,~,~] = corrcoef(Disp_Dif_End_Start_Long,Shape_Dif_End_Start_Long);
display('continuous: Slant from Disparity & Shape Adaptation end-start');
display(['r = ' num2str(r(2),3),', p = ' num2str(p(2),3)]);
display(' ');

%intermittent group
[r,p] = corrcoef(Disp_Dif_End_Start_Short,Shape_Dif_End_Start_Short);
display('intermittent: Slant from Disparity & Shape Adaptation end-start');
display(['r = ' num2str(r(2),3),', p = ' num2str(p(2),4)]);
display(' ');

% both groups
[r,p] = corrcoef([Disp_Dif_End_Start_Long Disp_Dif_End_Start_Short],[Shape_Dif_End_Start_Short Shape_Dif_End_Start_Long]);
display('both groups: Slant vs Shape Adaptation');
display(['r = ' num2str(r(2),3),', p = ' num2str(p(2),4)]);
display(' ');




display('**SLANT & SHAPE AFTEREFFECT**');

%Shape vs Disparity post-pre
%continuous group
[r,p,~,~] = corrcoef(Disp_Dif_Post_Pre_Long,Shape_Dif_Post_Pre_Long);
display('continuous: Slant from Disparity & Shape post-pre');
display(['r = ' num2str(r(2),3),', p = ' num2str(p(2),4)]);
display(' ');

%intermittent group
[r,p] = corrcoef(Disp_Dif_Post_Pre_Short,Shape_Dif_Post_Pre_Short);
display('intermittent: Slant from Disparity & Shape post-pre');
display(['r = ' num2str(r(2),3),', p = ' num2str(p(2),4)]);
display(' ');

% both groups
[r,p] = corrcoef([Disp_Dif_Post_Pre_Short Disp_Dif_Post_Pre_Long],[Shape_Dif_Post_Pre_Short Shape_Dif_Post_Pre_Long]);
display('both groups: Slant vs Shape Aftereffect');
display(['r = ' num2str(r(2),3),', p = ' num2str(p(2),4)]);
display(' ');





display('**SHAPE ADAPTATION AND AFTEREFFECT**');
%continuous group
[r,p,~,~] = corrcoef(Shape_Dif_End_Start_Long,Shape_Dif_Post_Pre_Long);
display('continuous: Shape Adaptation vs aftereffect');
display(['r = ' num2str(r(2),3),', p = ' num2str(p(2),3)]);
display(' ');

%intermittent group
[r,p] = corrcoef(Shape_Dif_End_Start_Short,Shape_Dif_Post_Pre_Short);
display('intermittent: Shape Adaptation vs aftereffect');
display(['r = ' num2str(r(2),3),', p = ' num2str(p(2),4)]);
display(' ');

% both groups
[r,p] = corrcoef([Shape_Dif_End_Start_Short Shape_Dif_End_Start_Long],[Shape_Dif_Post_Pre_Short Shape_Dif_Post_Pre_Long]);
display('both groups: Shape Adaptation vs aftereffect');
display(['r = ' num2str(r(2),3),', p = ' num2str(p(2),4)]);
display(' ');



display('**SLANT (DISP) ADAPTATION AND AFTEREFFECT**');
%continuous group
[r,p,~,~] = corrcoef(Disp_Dif_End_Start_Long,Disp_Dif_Post_Pre_Long);
display('continuous: Disp Adaptation vs aftereffect');
display(['r = ' num2str(r(2),3),', p = ' num2str(p(2),3)]);
display(' ');

%intermittent group
[r,p] = corrcoef(Disp_Dif_End_Start_Short,Disp_Dif_Post_Pre_Short);
display('intermittent: Disp Adaptation vs aftereffect');
display(['r = ' num2str(r(2),3),', p = ' num2str(p(2),4)]);
display(' ');

% both groups
[r,p] = corrcoef([Disp_Dif_End_Start_Short Disp_Dif_End_Start_Long],[Disp_Dif_Post_Pre_Short Disp_Dif_Post_Pre_Long]);
display('both groups: Disp Adaptation vs aftereffect');
display(['r = ' num2str(r(2),3),', p = ' num2str(p(2),4)]);
display(' ');



display('**SLANT (DUAL) ADAPTATION AND AFTEREFFECT**');
%continuous group
[r,p,~,~] = corrcoef(Dual_Dif_End_Start_Long,Dual_Dif_Post_Pre_Long);
display('continuous: Dual Adaptation vs aftereffect');
display(['r = ' num2str(r(2),3),', p = ' num2str(p(2),3)]);
display(' ');

%intermittent group
[r,p] = corrcoef(Dual_Dif_End_Start_Short,Dual_Dif_Post_Pre_Short);
display('intermittent: Dual Adaptation vs aftereffect');
display(['r = ' num2str(r(2),3),', p = ' num2str(p(2),4)]);
display(' ');

% both groups
[r,p] = corrcoef([Dual_Dif_End_Start_Short Dual_Dif_End_Start_Long],[Dual_Dif_Post_Pre_Short Dual_Dif_Post_Pre_Long]);
display('both groups: Dual Adaptation vs aftereffect');
display(['r = ' num2str(r(2),3),', p = ' num2str(p(2),4)]);
display(' ');





% Plots

%Shape vs Disp start-pre
figure, hold on;
subplot(2,3,1); hold on;
title('Initial Bias (start-pre)');
L = scatter(Disp_Dif_Start_Pre_Long,Shape_Dif_Start_Pre_Long,"MarkerEdgeColor",[1,0,0]); %continuous
S = scatter(Disp_Dif_Start_Pre_Short,Shape_Dif_Start_Pre_Short,"MarkerEdgeColor",[0,0,0]);
xlabel('Disparity-only difference (deg)');
ylabel('Shape Distortion height ratio difference');

%Shape Vs Disp post-pre
subplot(2,3,2); hold on;
L = scatter(Disp_Dif_End_Start_Long,Shape_Dif_End_Start_Long,"MarkerEdgeColor",[1,0,0]); %continuous
S = scatter(Disp_Dif_End_Start_Short,Shape_Dif_End_Start_Short,"MarkerEdgeColor",[0,0,0]);
legend([L S],'Continuous group','Intermittent Group');
title('Adaptation (end-start)');

%Shape Vs Disp post-pre
subplot(2,3,3); hold on;
title('Aftereffect (post-pre)');
L = scatter(Disp_Dif_Post_Pre_Long,Shape_Dif_Post_Pre_Long,"MarkerEdgeColor",[1,0,0]); %continuous
S = scatter(Disp_Dif_Post_Pre_Short,Shape_Dif_Post_Pre_Short,"MarkerEdgeColor",[0,0,0]);


% Dual cue vs Disp
subplot(2,3,4); hold on; %initial bias
scatter(Disp_Dif_Start_Pre_Long,Dual_Dif_Start_Pre_Long,"MarkerEdgeColor",[1,0,0]); %continuous
scatter(Disp_Dif_Start_Pre_Short,Dual_Dif_Start_Pre_Short,"MarkerEdgeColor",[0,0,0]);
xlabel('Disparity-only difference (deg)');
ylabel('Dual cue difference (deg)');

subplot(2,3,5); hold on; %adaptation
scatter(Disp_Dif_End_Start_Long,Dual_Dif_End_Start_Long,"MarkerEdgeColor",[1,0,0]); %continuous
scatter(Disp_Dif_End_Start_Short,Dual_Dif_End_Start_Short,"MarkerEdgeColor",[0,0,0]);

subplot(2,3,6); hold on; %aftereffect
scatter(Disp_Dif_Post_Pre_Long,Dual_Dif_Post_Pre_Long,"MarkerEdgeColor",[1,0,0]); %continuous
scatter(Disp_Dif_Post_Pre_Short,Dual_Dif_Post_Pre_Short,"MarkerEdgeColor",[0,0,0]);


%Plot
%shape adaption vs shape aftereffect
%Shape Vs Disp start-pre
figure, hold on;
title('Shape Distortion height ratio difference');
L = scatter(Shape_Dif_End_Start_Long,Shape_Dif_Post_Pre_Long,"MarkerEdgeColor",[1,0,0]); %continuous
S = scatter(Shape_Dif_End_Start_Short,Shape_Dif_Post_Pre_Short,"MarkerEdgeColor",[0,0,0]);
xlabel('Adaptation (end-start)');
ylabel('Aftereffect (post-pre)');
legend([L S],'Continuous group','Intermittent Group');


%% Time course of adaptation and decay
%Task is self timed and we don’t have a timestamp for each trial. We will have to use trial ordering instead of time.
%note: I do not correct the texture values in this plot

%average across start adapt for all subjects for each condition. Split
%between groups

% PRE

%continuous
Persp_Pre_Trials_Long     = nanmean(movmean(Persp_unb(:,1,long_inds),3,1,'omitnan','Endpoints','discard'),3);
Std_Persp_Pre_Trials_Long = nanstd(movmean(Persp_unb(:,1,long_inds),3,1,'omitnan','Endpoints','discard'),0,3);
Disp_Pre_Trials_Long      = nanmean(movmean(Disp(:,1,long_inds),3,1,'omitnan','Endpoints','discard'),3);
Std_Disp_Pre_Trials_Long  = nanstd(movmean(Disp(:,1,long_inds),3,1,'omitnan','Endpoints','discard'),0,3);
Dual_Pre_Trials_Long      = nanmean(movmean(Dual(:,1,long_inds),3,1,'omitnan','Endpoints','discard'),3);
Std_Dual_Pre_Trials_Long  = nanstd(movmean(Dual(:,1,long_inds),3,1,'omitnan','Endpoints','discard'),0,3);
Shape_Pre_Trials_Long     = nanmean(movmean(Shape(:,1,long_inds),3,1,'omitnan','Endpoints','discard'),3);
Std_Shape_Pre_Trials_Long = nanstd(movmean(Shape(:,1,long_inds),3,1,'omitnan','Endpoints','discard'),0,3);

%intermittent
Persp_Pre_Trials_Short     = nanmean(movmean(Persp_unb(:,1,short_inds),3,1,'omitnan','Endpoints','discard'),3);
Std_Persp_Pre_Trials_Short = nanstd(movmean(Persp_unb(:,1,short_inds),3,1,'omitnan','Endpoints','discard'),0,3);
Disp_Pre_Trials_Short      = nanmean(movmean(Disp(:,1,short_inds),3,1,'omitnan','Endpoints','discard'),3);
Std_Disp_Pre_Trials_Short  = nanstd(movmean(Disp(:,1,short_inds),3,1,'omitnan','Endpoints','discard'),0,3);
Dual_Pre_Trials_Short      = nanmean(movmean(Dual(:,1,short_inds),3,1,'omitnan','Endpoints','discard'),3);
Std_Dual_Pre_Trials_Short  = nanstd(movmean(Dual(:,1,short_inds),3,1,'omitnan','Endpoints','discard'),0,3);
Shape_Pre_Trials_Short     = nanmean(movmean(Shape(:,1,short_inds),3,1,'omitnan','Endpoints','discard'),3);
Std_Shape_Pre_Trials_Short = nanstd(movmean(Shape(:,1,short_inds),3,1,'omitnan','Endpoints','discard'),0,3);

% START

%continuous
Persp_Start_Trials_Long     = nanmean(movmean(Persp_unb(:,2,long_inds),3,1,'omitnan','Endpoints','discard'),3);
Std_Persp_Start_Trials_Long = nanstd(movmean(Persp_unb(:,2,long_inds),3,1,'omitnan','Endpoints','discard'),0,3);
Disp_Start_Trials_Long      = nanmean(movmean(Disp(:,2,long_inds),3,1,'omitnan','Endpoints','discard'),3);
Std_Disp_Start_Trials_Long  = nanstd(movmean(Disp(:,2,long_inds),3,1,'omitnan','Endpoints','discard'),0,3);
Dual_Start_Trials_Long      = nanmean(movmean(Dual(:,2,long_inds),3,1,'omitnan','Endpoints','discard'),3);
Std_Dual_Start_Trials_Long  = nanstd(movmean(Dual(:,2,long_inds),3,1,'omitnan','Endpoints','discard'),0,3);
Shape_Start_Trials_Long     = nanmean(movmean(Shape(:,2,long_inds),3,1,'omitnan','Endpoints','discard'),3);
Std_Shape_Start_Trials_Long = nanstd(movmean(Shape(:,2,long_inds),3,1,'omitnan','Endpoints','discard'),0,3);

%intermittent
Persp_Start_Trials_Short     = nanmean(movmean(Persp_unb(:,2,short_inds),3,1,'omitnan','Endpoints','discard'),3);
Std_Persp_Start_Trials_Short = nanstd(movmean(Persp_unb(:,2,short_inds),3,1,'omitnan','Endpoints','discard'),0,3);
Disp_Start_Trials_Short      = nanmean(movmean(Disp(:,2,short_inds),3,1,'omitnan','Endpoints','discard'),3);
Std_Disp_Start_Trials_Short  = nanstd(movmean(Disp(:,2,short_inds),3,1,'omitnan','Endpoints','discard'),0,3);
Dual_Start_Trials_Short      = nanmean(movmean(Dual(:,2,short_inds),3,1,'omitnan','Endpoints','discard'),3);
Std_Dual_Start_Trials_Short  = nanstd(movmean(Dual(:,2,short_inds),3,1,'omitnan','Endpoints','discard'),0,3);
Shape_Start_Trials_Short     = nanmean(movmean(Shape(:,2,short_inds),3,1,'omitnan','Endpoints','discard'),3);
Std_Shape_Start_Trials_Short = nanstd(movmean(Shape(:,2,short_inds),3,1,'omitnan','Endpoints','discard'),0,3);

% END

%continuous
Persp_End_Trials_Long     = nanmean(movmean(Persp_unb(:,3,long_inds),3,1,'omitnan','Endpoints','discard'),3);
Std_Persp_End_Trials_Long = nanstd(movmean(Persp_unb(:,3,long_inds),3,1,'omitnan','Endpoints','discard'),0,3);
Disp_End_Trials_Long      = nanmean(movmean(Disp(:,3,long_inds),3,1,'omitnan','Endpoints','discard'),3);
Std_Disp_End_Trials_Long  = nanstd(movmean(Disp(:,3,long_inds),3,1,'omitnan','Endpoints','discard'),0,3);
Dual_End_Trials_Long      = nanmean(movmean(Dual(:,3,long_inds),3,1,'omitnan','Endpoints','discard'),3);
Std_Dual_End_Trials_Long  = nanstd(movmean(Dual(:,3,long_inds),3,1,'omitnan','Endpoints','discard'),0,3);
Shape_End_Trials_Long     = nanmean(movmean(Shape(:,3,long_inds),3,1,'omitnan','Endpoints','discard'),3);
Std_Shape_End_Trials_Long = nanstd(movmean(Shape(:,3,long_inds),3,1,'omitnan','Endpoints','discard'),0,3);

%intermittent
Persp_End_Trials_Short     = nanmean(movmean(Persp_unb(:,3,short_inds),3,1,'omitnan','Endpoints','discard'),3);
Std_Persp_End_Trials_Short = nanstd(movmean(Persp_unb(:,3,short_inds),3,1,'omitnan','Endpoints','discard'),0,3);
Disp_End_Trials_Short      = nanmean(movmean(Disp(:,3,short_inds),3,1,'omitnan','Endpoints','discard'),3);
Std_Disp_End_Trials_Short  = nanstd(movmean(Disp(:,3,short_inds),3,1,'omitnan','Endpoints','discard'),0,3);
Dual_End_Trials_Short      = nanmean(movmean(Dual(:,3,short_inds),3,1,'omitnan','Endpoints','discard'),3);
Std_Dual_End_Trials_Short  = nanstd(movmean(Dual(:,3,short_inds),3,1,'omitnan','Endpoints','discard'),0,3);
Shape_End_Trials_Short     = nanmean(movmean(Shape(:,3,short_inds),3,1,'omitnan','Endpoints','discard'),3);
Std_Shape_End_Trials_Short = nanstd(movmean(Shape(:,3,short_inds),3,1,'omitnan','Endpoints','discard'),0,3);

% POST

%continuous
Persp_Post_Trials_Long     = nanmean(movmean(Persp_unb(:,4,long_inds),3,1,'omitnan','Endpoints','discard'),3);
Std_Persp_Post_Trials_Long = nanstd(movmean(Persp_unb(:,4,long_inds),3,1,'omitnan','Endpoints','discard'),0,3);
Disp_Post_Trials_Long      = nanmean(movmean(Disp(:,4,long_inds),3,1,'omitnan','Endpoints','discard'),3);
Std_Disp_Post_Trials_Long  = nanstd(movmean(Disp(:,4,long_inds),3,1,'omitnan','Endpoints','discard'),0,3);
Dual_Post_Trials_Long      = nanmean(movmean(Dual(:,4,long_inds),3,1,'omitnan','Endpoints','discard'),3);
Std_Dual_Post_Trials_Long  = nanstd(movmean(Dual(:,4,long_inds),3,1,'omitnan','Endpoints','discard'),0,3);
Shape_Post_Trials_Long     = nanmean(movmean(Shape(:,4,long_inds),3,1,'omitnan','Endpoints','discard'),3);
Std_Shape_Post_Trials_Long = nanstd(movmean(Shape(:,4,long_inds),3,1,'omitnan','Endpoints','discard'),0,3);

%intermittent
Persp_Post_Trials_Short     = nanmean(movmean(Persp_unb(:,4,short_inds),3,1,'omitnan','Endpoints','discard'),3);
Std_Persp_Post_Trials_Short = nanstd(movmean(Persp_unb(:,4,short_inds),3,1,'omitnan','Endpoints','discard'),0,3);
Disp_Post_Trials_Short      = nanmean(movmean(Disp(:,4,short_inds),3,1,'omitnan','Endpoints','discard'),3);
Std_Disp_Post_Trials_Short  = nanstd(movmean(Disp(:,4,short_inds),3,1,'omitnan','Endpoints','discard'),0,3);
Dual_Post_Trials_Short      = nanmean(movmean(Dual(:,4,short_inds),3,1,'omitnan','Endpoints','discard'),3);
Std_Dual_Post_Trials_Short  = nanstd(movmean(Dual(:,4,short_inds),3,1,'omitnan','Endpoints','discard'),0,3);
Shape_Post_Trials_Short     = nanmean(movmean(Shape(:,4,short_inds),3,1,'omitnan','Endpoints','discard'),3);
Std_Shape_Post_Trials_Short = nanstd(movmean(Shape(:,4,short_inds),3,1,'omitnan','Endpoints','discard'),0,3);


%plotting variables
Measurmentstr       = {'Pre','Start','End','Post'};
condstr             = {'Persp','Disp','Dual','Shape'};

counter = 0;

%Plot time courese of adaptation and decay
figure,hold on;
sgtitle('Slant percieved frontoparallel accross time (deg)');
for m = 1:4 %each measurement session Start or Post
    
    
    
    for cond = 1:4 %conditions Perspective, disparity, dual, shape
        
        % calculate 95% CI across subjects
        eval(['CI_Long = 1.96*(Std_',...
            condstr{cond},'_',Measurmentstr{m},'_Trials_Long /sqrt(15));']);
        eval(['CI_Short = 1.96*(Std_',...
            condstr{cond},'_',Measurmentstr{m},'_Trials_Short /sqrt(15));']);
        
        counter = counter + 1;
        
        subplot(4,4,counter); hold on;
        
        %shape plots
        if cond == 4
            
            eval(['L = plot(1:1:length(Shape_Post_Trials_Long),',condstr{cond},...
                '_',Measurmentstr{m},'_Trials_Long,"-or");']); %continuous
            
            eval(['Er = errorbar(1:1:length(Shape_Post_Trials_Long),' condstr{cond},...
                '_',Measurmentstr{m},'_Trials_Long,-(CI_Long),CI_Long); Er.Color=[1 0 0]; Er.LineStyle = "none";']); %error bar
            
            eval(['S = plot(1:1:length(Shape_Post_Trials_Long),',condstr{cond},...
                '_',Measurmentstr{m},'_Trials_Short,"-dk");']); %intermittent
            
            eval(['Er = errorbar(1:1:length(Shape_Post_Trials_Short),' condstr{cond},...
                '_',Measurmentstr{m},'_Trials_Short,-(CI_Short),CI_Short); Er.Color=[0 0 0]; Er.LineStyle = "none";']); %error bar
            
            % plot reference line
            hline = refline(0,1); hline.Color = 'k'; hline.LineStyle = '--';
            
        %slant plots
        else
            
            eval(['plot(1:2:length(Persp_Post_Trials_Long),decimate(',condstr{cond},...
                '_',Measurmentstr{m},'_Trials_Long,2),"-or");']);%continuous
            
            eval(['Er = errorbar(1:2:length(Persp_Post_Trials_Long),decimate(' condstr{cond},...
                '_',Measurmentstr{m},'_Trials_Long,2),-(decimate(CI_Long,2)),decimate(CI_Long,2)); Er.Color=[1 0 0]; Er.LineStyle = "none";']); %error bar
            
            eval(['plot(1:2:length(Persp_Post_Trials_Long),decimate(',condstr{cond},...
                '_',Measurmentstr{m},'_Trials_Short,2),"-dk");']); %intermittent
            
            eval(['Er = errorbar(1:2:length(Persp_Post_Trials_Long),decimate(' condstr{cond},...
                '_',Measurmentstr{m},'_Trials_Short,2),-(decimate(CI_Short,2)),decimate(CI_Short,2)); Er.Color=[0 0 0]; Er.LineStyle = "none";']); %error bar
            
            % plot reference line
            hline = refline(0,0); hline.Color = 'k'; hline.LineStyle = '--';
        end
        
        
        
        %axes
        if counter == 1
            title('Perspective-only')
            ylabel('\bfPre');
            % plot reference line
            hline = refline(0,0); hline.Color = 'k'; hline.LineStyle = '--';
            
        elseif counter == 2
            title('Disparity-only')
            
        elseif counter == 3
            title('Dual Cue');
            
        elseif counter == 4 
            title('Shape')
            
        elseif counter == 5 
            ylabel('\bfStart Adapt');
            
        elseif counter == 9
            ylabel('\bfEnd Adapt');
            
        elseif counter == 13
            xlabel('Trials');
            ylabel('\bfPost');
            
        elseif counter == 14
            xlabel('Trials');
            
        elseif counter == 15
            xlabel('Trials');
            
        elseif counter == 16
            xlabel('Trials');
        end
        
    end
    
    
end

legend([L S],'Continuous','Intermittent');

hold off;




%plotting variables - V2 of the plot above
Measurmentstr       = {'Start','Post'};
condstr             = {'Persp','Disp','Dual'};

counter = 0;

%Plot time courese of adaptation and decay
figure,hold on;
for m = 1:2 %each measurement session Start or Post
    
    for cond = 1:3 %conditions Perspective, disparity, dual, shape
        
        % calculate 95% CI across subjects
        eval(['CI_Long = 1.96*(Std_',...
            condstr{cond},'_',Measurmentstr{m},'_Trials_Long /sqrt(15));']);
        eval(['CI_Short = 1.96*(Std_',...
            condstr{cond},'_',Measurmentstr{m},'_Trials_Short /sqrt(15));']);
        
        counter = counter + 1;
        
        subplot(2,3,counter); hold on;
        
        eval(['plot(1:1:length(Persp_Post_Trials_Long),',condstr{cond},...
            '_',Measurmentstr{m},'_Trials_Long,"-or");']);%continuous
        
        eval(['Er = errorbar(1:1:length(Persp_Post_Trials_Long),' condstr{cond},...
            '_',Measurmentstr{m},'_Trials_Long,-(CI_Long),CI_Long); Er.Color=[1 0 0]; Er.LineStyle = "none";']); %error bar
        
        eval(['plot(1:1:length(Persp_Post_Trials_Long),',condstr{cond},...
            '_',Measurmentstr{m},'_Trials_Short,"-dk");']); %intermittent
        
        eval(['Er = errorbar(1:1:length(Persp_Post_Trials_Short),' condstr{cond},...
            '_',Measurmentstr{m},'_Trials_Short,-(CI_Short),CI_Short); Er.Color=[0 0 0]; Er.LineStyle = "none";']); %error bar
        
        hline = refline(0,0); hline.Color = 'k'; hline.LineStyle = '--'; %reference line
        
        
        
        %axes
        if counter == 1
            title('Perspective-only')
            ylabel('Slant percieved frontoparallel (deg)');
            
        elseif counter == 2
            title('Disparity-only')
            
        elseif counter == 3
            title('Dual Cue');
            
        elseif counter == 4
            xlabel('Trials');
            ylabel('Slant percieved frontoparallel (deg)');
            
        elseif counter == 5
            xlabel('Trials');
        elseif counter == 6
            xlabel('Trials');
        end
    end
end

hold off;




%plotting variables - V2 Just SHAPE
Measurmentstr       = {'Start','Post'};
condstr             = {'Shape'};

counter = 0;

%Plot time courese of adaptation and decay
figure,hold on;
for m = 1:2 %each measurement session Start or Post
    
    cond = 1;
    
    % calculate 95% CI across subjects
    eval(['CI_Long = 1.96*(Std_',...
        condstr{cond},'_',Measurmentstr{m},'_Trials_Long /sqrt(15));']);
    eval(['CI_Short = 1.96*(Std_',...
        condstr{cond},'_',Measurmentstr{m},'_Trials_Short /sqrt(15));']);
    counter = counter + 1;
    
    subplot(2,1,counter); hold on;
    
    
 
    eval(['L = plot(1:1:length(Shape_Post_Trials_Long),',condstr{cond},...
        '_',Measurmentstr{m},'_Trials_Long,"-or");']); %continuous
    
    eval(['Er = errorbar(1:1:length(Shape_Post_Trials_Long),' condstr{cond},...
        '_',Measurmentstr{m},'_Trials_Long,-(CI_Long),CI_Long); Er.Color=[1 0 0]; Er.LineStyle = "none";']); %error bar
    
    eval(['S = plot(1:1:length(Shape_Post_Trials_Long),',condstr{cond},...
        '_',Measurmentstr{m},'_Trials_Short,"-dk");']); %intermittent
    
    eval(['Er = errorbar(1:1:length(Shape_Post_Trials_Short),' condstr{cond},...
        '_',Measurmentstr{m},'_Trials_Short,-(CI_Short),CI_Short); Er.Color=[0 0 0]; Er.LineStyle = "none";']); %error bar
    
    hline = refline(0,1); hline.Color = 'k'; hline.LineStyle = '--'; %reference line
    
    %axes
    if counter == 1
        title('Shape')
        ylabel('Height ratio right over left');
    elseif counter == 2
        xlabel('Trials');
    end
    
end

legend([L S],'Continuous','Intermittent');

hold off;

