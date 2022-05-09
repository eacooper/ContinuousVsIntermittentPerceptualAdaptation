the folder Scripts includes:

All Data: raw data for the expeirment
    Disp  = slant judgment for the disparity condition for all four measurements for each participant. 
           row=trial, col=measurement(pre,start,end,post), 3rd=subject
    DispR = same as above with outliers included
    Dual  = slant judgments from dual stimuli. row=trial, col=measurement(pre,start,end,post), 3rd=subject
    DualR = same as above with outlier data points included
    Group = list of the group each subject belonged to
    ipds  = interpupilary distance for each subejct
    Persp = slant judgments from perspective condition. row=trial, col=measurement(pre,start,end,post), 3rd=subject
    PerspR = same as above with outlier data points included
    session = cell array of labels of the four measurement sessions
    Shape   = responses from shape judgment task row=trial, col=measurement, 3rd=subject
    ShapeR  = same as above with outlier data points included
    SubjIDs = list of subject IDs
    
run_analysis: runs each of the scripts in the folder. Each script may include a figure, statistics reported
              in the paper, or exploritory analysis included or not incldued in the paper.
    
