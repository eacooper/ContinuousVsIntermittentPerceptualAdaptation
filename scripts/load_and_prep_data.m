clear all;
close all;

% add path to subtightplot
addpath('./subtightplot');

%Variables needed for anaysis
session = {'Pre','t1','t2','Post'};
SubjIDs = [12,16,17,22,23,25,26,20,28,24,21,33,19,31,34,37,40,48,27,38,47,36,...
    51,54,53,41,52,55,58,57,61,64,65,67,69,72,73,66,81,76,83,78,74,70,82]; %subject IDs

%-----------------FILE LIBRARY---------------------------------
%creating a file library for pre,t1,t2, and post sessions.

%file library for slant (row = participant, column=session)
%the number indicates the participant ID

%this exeperiment has three groups (long interval, short interval, and control). I will
%add an additional cell to indicate which group the participant is in

%HM12
files_slant(1,:) = {'HM12_pre_120TrialsRun_05_17_21_0911','HM12_t1_90TrialsRun_05_17_21_0929',...
    'HM12_t2_90TrialsRun_05_17_21_1501','HM12_post_120TrialsRun_05_17_21_1515','long'};
%HM16
files_slant(2,:)={'HM16_pre_120TrialsRun_05_13_21_1046','HM16_t1_90TrialsRun_05_13_21_1119',...
    'HM16_t2_90TrialsRun_05_13_21_1604','HM16_post_120TrialsRun_05_13_21_1624','long'};
%HM17
files_slant(3,:)={'HM17_pre_120TrialsRun_05_20_21_0909','HM17_t1_90TrialsRun_05_20_21_0927',...
    'HM17_t2_90TrialsRun_05_20_21_1501','HM17_post_120TrialsRun_05_20_21_1512','long'};
%HM22
files_slant(4,:)={'HM22_pre_120TrialsRun_05_18_21_0905','HM22_t1_90TrialsRun_05_18_21_0936',...
    'HM22_t2_90TrialsRun_05_18_21_1505','HM22_post_120TrialsRun_05_18_21_1520','long'};
%HM23
files_slant(5,:)={'HM23_pre_120TrialsRun_05_19_21_0859','HM23_t1_90TrialsRun_05_19_21_0922',...
    'HM23_t2_90TrialsRun_05_19_21_1514','HM23_post_120TrialsRun_05_19_21_1529','long'};
%HM25
files_slant(6,:)={'HM25_pre_120TrialsRun_05_26_21_0907','HM25_t1_90TrialsRun_05_26_21_0941',...
    'HM25_t2_90TrialsRun_05_26_21_1459','HM25_post_120TrialsRun_05_26_21_1519','long'};
%HM26
files_slant(7,:)={'HM26_pre_120TrialsRun_05_27_21_0904','HM26_t1_90TrialsRun_05_27_21_0933',...
    'HM26_t2_90TrialsRun_05_27_21_1500','HM26_post_120TrialsRun_05_27_21_1513','long'};
%HM20 - short
files_slant(8,:)={'HM20_pre_120TrialsRun_06_02_21_0922','HM20_t1_90TrialsRun_06_02_21_1014',...
    'HM20_t2_90TrialsRun_06_02_21_1713','HM20_post_120TrialsRun_06_02_21_1740','short'};
%HM28 - short
files_slant(9,:)={'HM28_pre_120TrialsRun_06_03_21_0911','HM28_t1_90TrialsRun_06_03_21_0947', ...
    'HM28_t2_90TrialsRun_06_03_21_1659','HM28_post_120TrialsRun_06_03_21_1719','short'};
%HM24 - short
files_slant(10,:)={'HM24_pre_120TrialsRun_06_04_21_0909','HM24_t1_90TrialsRun_06_04_21_0938'...
    'HM24_t2_90TrialsRun_06_04_21_1700','HM24_post_120TrialsRun_06_04_21_1714','short'};
%HM21 - long
files_slant(11,:)={'HM21_pre_120TrialsRun_06_05_21_1006','HM21_t1_90TrialsRun_06_05_21_1019',...
    'HM21_t2_90TrialsRun_06_05_21_1605', 'HM21_post_120TrialsRun_06_05_21_1614','long'};
%HM33 - long
files_slant(12,:)={'HM33_pre_120TrialsRun_06_07_21_1002','HM33_t1_90TrialsRun_06_07_21_1027'...
    'HM33_t2_90TrialsRun_06_07_21_1601','HM33_post_120TrialsRun_06_07_21_1617','long'};
%HM19 - short
files_slant(13,:)={'HM19_pre_120TrialsRun_06_09_21_0909','HM19_t1_90TrialsRun_06_09_21_0948',...
    'HM19_t2_90TrialsRun_06_09_21_1707','HM19_post_120TrialsRun_06_09_21_1723','short'};
%HM31 - short
files_slant(14,:)={'HM31_pre_120TrialsRun_06_10_21_0850','HM31_t1_90TrialsRun_06_10_21_0902',...
    'HM31_t2_90TrialsRun_06_10_21_1656','HM31_post_120TrialsRun_06_10_21_1706','short'};
%HM34 -short
files_slant(15,:)={'HM34_pre_120TrialsRun_06_11_21_0909','HM34_t1_90TrialsRun_06_11_21_0925',...
    'HM34_t2_90TrialsRun_06_11_21_1701','HM34_post_120TrialsRun_06_11_21_1713','short'};
% %HM44 - short (excluded)
% files_slant(16,:)={'HM44_pre_120TrialsRun_06_14_21_0854','HM44_t1_90TrialsRun_06_14_21_0917',...
%     'HM44_t2_90TrialsRun_06_14_21_1708','HM44_post_120TrialsRun_06_14_21_1726','short'};
%HM37 - short (excluded)
files_slant(16,:)={'HM37_pre_120TrialsRun_06_15_21_0913','HM37_t1_90TrialsRun_06_15_21_0937',...
    'HM37_t2_90TrialsRun_06_15_21_1700','HM37_post_120TrialsRun_06_15_21_1716','short'};
% %HM39 - short (excluded)
% files_slant(18,:)={'HM39_pre_120TrialsRun_06_16_21_0905','HM39_t1_90TrialsRun_06_16_21_0938',...
%     'HM39_t2_90TrialsRun_06_16_21_1709','HM39_post_120TrialsRun_06_16_21_1728','short'};
%HM40 - short
files_slant(17,:)={'HM40_pre_120TrialsRun_06_17_21_0921','HM40_t1_90TrialsRun_06_17_21_0954'...
    'HM40_t2_90TrialsRun_06_17_21_1659','HM40_post_120TrialsRun_06_17_21_1717','short'};
%HM48 - long
files_slant(18,:)={'HM48_pre_120TrialsRun_06_18_21_1047','HM48_t1_90TrialsRun_06_18_21_1135'...
    'HM48_t2_90TrialsRun_06_18_21_1703','HM48_post_120TrialsRun_06_18_21_1727','long'};
%HM27 - short
files_slant(19,:)={'HM27_pre_120TrialsRun_06_21_21_0907','HM27_t1_90TrialsRun_06_21_21_0948'...
    'HM27_t2_90TrialsRun_06_21_21_1702','HM27_post_120TrialsRun_06_21_21_1720','short'};
%HM38 - short
files_slant(20,:)={'HM38_pre_120TrialsRun_06_22_21_0916','HM38_t1_90TrialsRun_06_22_21_0939'...
    'HM38_t2_90TrialsRun_06_22_21_1702','HM38_post_120TrialsRun_06_22_21_1718','short'};
%HM47 - long
files_slant(21,:)={'HM47_pre_120TrialsRun_06_23_21_0906','HM47_t1_90TrialsRun_06_23_21_0924',...
    'HM47_t2_90TrialsRun_06_23_21_1501','HM47_post_120TrialsRun_06_23_21_1514','long'};
%HM36 - short
files_slant(22,:)={'HM36_pre_120TrialsRun_06_24_21_0926','HM36_t1_90TrialsRun_06_24_21_0942',...
    'HM36_t2_90TrialsRun_06_24_21_1705','HM36_post_120TrialsRun_06_24_21_1721','short'};
%HM51 - long
files_slant(23,:)={'HM51_pre_120TrialsRun_06_25_21_1028','HM51_t1_90TrialsRun_06_25_21_1100',...
    'HM51_t2_90TrialsRun_06_25_21_1633','HM51_post_120TrialsRun_06_25_21_1650','long'};
%HM54 - short
files_slant(24,:)={'HM54_pre_120TrialsRun_06_28_21_0850','HM54_t1_90TrialsRun_06_28_21_0905',...
    'HM54_t2_90TrialsRun_06_28_21_1703','HM54_post_120TrialsRun_06_28_21_1712','short'};
%HM53 - long
files_slant(25,:)={'HM53_pre_120TrialsRun_06_28_21_1010','HM53_t1_90TrialsRun_06_28_21_1027',...
    'HM53_t2_90TrialsRun_06_28_21_1601','HM53_post_120TrialsRun_06_28_21_1614','long'};
%HM41 - short
files_slant(26,:)={'HM41_pre_120TrialsRun_07_01_21_0910','HM41_t1_90TrialsRun_07_01_21_0938'...
    'HM41_t2_90TrialsRun_07_01_21_1702','HM41_post_120TrialsRun_07_01_21_1722','short'};
%HM52 - long
files_slant(27,:)={'HM52_pre_120TrialsRun_07_02_21_0808','HM52_t1_90TrialsRun_07_02_21_0830',...
    'HM52_t2_90TrialsRun_07_02_21_1400','HM52_post_120TrialsRun_07_02_21_1413','long'};
%HM55 - short
files_slant(28,:)={'HM55_pre_120TrialsRun_07_05_21_0915','HM55_t1_90TrialsRun_07_05_21_1002',...
    'HM55_t2_90TrialsRun_07_05_21_1707','HM55_post_120TrialsRun_07_05_21_1728','short'};
%HM58 - long
files_slant(29,:)={'HM58_pre_120TrialsRun_07_07_21_0914','HM58_t1_90TrialsRun_07_07_21_0935',...
    'HM58_t2_90TrialsRun_07_07_21_1512','HM58_post_120TrialsRun_07_07_21_1522','long'};
%HM57 - short
files_slant(30,:)={'HM57_pre_120TrialsRun_07_14_21_0908','HM57_t1_90TrialsRun_07_14_21_0950',...
    'HM57_t2_90TrialsRun_07_14_21_1704','HM57_post_120TrialsRun_07_14_21_1736','short'};
%HM61
files_slant(31,:)={'HM61_pre_120TrialsRun_08_18_21_1255','HM61_t1_90TrialsRun_08_18_21_1327',...
    'HM61_t2_90TrialsRun_08_18_21_1444','HM61_post_120TrialsRun_08_18_21_1456','control'};
%HM64
files_slant(32,:)={'HM64_pre_120TrialsRun_08_31_21_1409','HM64_t1_90TrialsRun_08_31_21_1425'...
    'HM64_t2_90TrialsRun_08_31_21_1540','HM64_post_120TrialsRun_08_31_21_1553','control'};
%HM65
files_slant(33,:)={'HM65_pre_120TrialsRun_09_03_21_1424','HM65_t1_90TrialsRun_09_03_21_1503',...
    'HM65_t2_90TrialsRun_09_03_21_1632','HM65_post_120TrialsRun_09_03_21_1652','control'};
% %HM63 (excluded)
% files_slant(34,:)={'HM63_pre_120TrialsRun_09_06_21_0908','HM63_t1_90TrialsRun_09_06_21_0933',...
%     'HM63_t2_90TrialsRun_09_06_21_1105','HM63_post_120TrialsRun_09_06_21_1117','control'};
%HM67
files_slant(34,:)={'HM67_pre_120TrialsRun_09_07_21_1419','HM67_t1_90TrialsRun_09_07_21_1437',...
    'HM67_t2_90TrialsRun_09_07_21_1603','HM67_post_120TrialsRun_09_07_21_1616','control'};
%HM69
files_slant(35,:)={'HM69_pre_120TrialsRun_09_09_21_0910','HM69_t1_90TrialsRun_09_09_21_0929',...
    'HM69_t2_90TrialsRun_09_09_21_1234','HM69_post_120TrialsRun_09_09_21_1248','control'};
%HM72
files_slant(36,:)={'HM72_pre_120TrialsRun_09_13_21_1314','HM72_t1_90TrialsRun_09_13_21_1331',...
    'HM72_t2_90TrialsRun_09_13_21_1445','HM72_post_120TrialsRun_09_13_21_1455','control'};
%HM73
files_slant(37,:)={'HM73_pre_120TrialsRun_09_14_21_1442','HM73_t1_90TrialsRun_09_14_21_1507',...
    'HM73_t2_90TrialsRun_09_14_21_1637','HM73_post_120TrialsRun_09_14_21_1650','control'};
%HM66
files_slant(38,:)={'HM66_pre_120TrialsRun_09_17_21_0920','HM66_t1_90TrialsRun_09_17_21_0938',...
    'HM66_t2_90TrialsRun_09_17_21_1349','HM66_post_120TrialsRun_09_17_21_1405','control'};
%HM81
files_slant(39,:)={'HM81_pre_120TrialsRun_09_20_21_0915','HM81_t1_90TrialsRun_09_20_21_0947',...
    'HM81_t2_90TrialsRun_09_20_21_1405','HM81_post_120TrialsRun_09_20_21_1414','control'};
%HM76
files_slant(40,:)={'HM76_pre_120TrialsRun_09_22_21_1341','HM76_t1_90TrialsRun_09_22_21_1419',...
    'HM76_t2_90TrialsRun_09_22_21_1539','HM76_post_120TrialsRun_09_22_21_1557','control'};
%HM83
files_slant(41,:)={'HM83_pre_120TrialsRun_09_23_21_1411','HM83_t1_90TrialsRun_09_23_21_1431',...
    'HM83_t2_90TrialsRun_09_23_21_1549','HM83_post_120TrialsRun_09_23_21_1604','control'};
%HM78
files_slant(42,:)={'HM78_pre_120TrialsRun_09_24_21_0909','HM78_t1_90TrialsRun_09_24_21_0941',...
    'HM78_t2_90TrialsRun_09_24_21_1106','HM78_post_120TrialsRun_09_24_21_1125','control'};
%HM74
files_slant(43,:)={'HM74_pre_120TrialsRun_09_24_21_1406','HM74_t1_90TrialsRun_09_24_21_1424',...
    'HM74_t2_90TrialsRun_09_24_21_1540','HM74_post_120TrialsRun_09_24_21_1550','control'};
%HM70
files_slant(44,:)={'HM70_pre_120TrialsRun_09_28_21_1054','HM70_t1_90TrialsRun_09_28_21_1110',...
    'HM70_t2_90TrialsRun_09_28_21_1235','HM70_post_120TrialsRun_09_28_21_1246','control'};
%HM82
files_slant(45,:)={'HM82_pre_120TrialsRun_10_04_21_0912','HM82_t1_90TrialsRun_10_04_21_0930',...
    'HM82_t2_90TrialsRun_10_04_21_1204','HM82_post_120TrialsRun_10_04_21_1217','control'};

%file library for rectangle judgement

%HM12
files_rect(1,:)= {'HM12_RectJud_pre_10TrialsRun_05_17_21_0925','HM12_RectJud_t1_10TrialsRun_05_17_21_0941', ...
    'HM12_RectJud_t2_10TrialsRun_05_17_21_1511','HM12_RectJud_post_10TrialsRun_05_17_21_1525','long'};
%HM16
files_rect(2,:)={'HM16_RectJud_pre_10TrialsRun_05_13_21_1116','HM16_RectJud_t1_10TrialsRun_05_13_21_1133',...
    'HM16_RectJud_t2_10TrialsRun_05_13_21_1621','HM16_RectJud_post_10TrialsRun_05_13_21_1642','long'};
%HM17
files_rect(3,:)={'HM17_RectJud_pre_10TrialsRun_05_20_21_0921','HM17_RectJud_t1_10TrialsRun_05_20_21_0936'...
    'HM17_RectJud_t2_10TrialsRun_05_20_21_1509','HM17_RectJud_post_10TrialsRun_05_20_21_1522','long'};
%HM22
files_rect(4,:) = {'HM22_RectJud_pre_10TrialsRun_05_18_21_0930','HM22_RectJud_t1_10TrialsRun_05_18_21_0946',...
    'HM22_RectJud_t2_10TrialsRun_05_18_21_1517','HM22_RectJud_post_10TrialsRun_05_18_21_1535','long'};
%HM23
files_rect(5,:) = {'HM23_RectJud_pre_10TrialsRun_05_19_21_0916','HM23_RectJud_t1_10TrialsRun_05_19_21_0935',...
    'HM23_RectJud_t2_10TrialsRun_05_19_21_1525','HM23_RectJud_post_10TrialsRun_05_19_21_1541','long'};
%HM25
files_rect(6,:) = {'HM25_RectJud_pre_10TrialsRun_05_26_21_0936','HM25_RectJud_t1_10TrialsRun_05_26_21_1002',...
    'HM25_RectJud_t2_10TrialsRun_05_26_21_1515','HM25_RectJud_post_10TrialsRun_05_26_21_1541','long'};
%HM26
files_rect(7,:) = {'HM26_RectJud_pre_10TrialsRun_05_27_21_0926','HM26_RectJud_t1_10TrialsRun_05_27_21_0946',...
    'HM26_RectJud_t2_10TrialsRun_05_27_21_1510','HM26_RectJud_post_10TrialsRun_05_27_21_1527','long'};
%HM20 - short
files_rect(8,:) = {'HM20_RectJud_pre_10TrialsRun_06_02_21_1009','HM20_RectJud_t1_10TrialsRun_06_02_21_1030',...
    'HM20_RectJud_t2_10TrialsRun_06_02_21_1735','HM20_RectJud_post_10TrialsRun_06_02_21_1804','short'};
%HM28 - short
files_rect(9,:)={'HM28_RectJud_pre_10TrialsRun_06_03_21_0943','HM28_RectJud_t1_10TrialsRun_06_03_21_1003',...
    'HM28_RectJud_t2_10TrialsRun_06_03_21_1715','HM28_RectJud_post_10TrialsRun_06_03_21_1740','short'};
%HM24 - short
files_rect(10,:)={'HM24_RectJud_pre_10TrialsRun_06_04_21_0930','HM24_RectJud_t1_10TrialsRun_06_04_21_0952',...
    'HM24_RectJud_t2_10TrialsRun_06_04_21_1711','HM24_RectJud_post_10TrialsRun_06_04_21_1728','short'};
%HM21 - long
files_rect(11,:)={'HM21_RectJud_pre_10TrialsRun_06_05_21_1016','HM21_RectJud_t1_10TrialsRun_06_05_21_1026',...
    'HM21_RectJud_t2_10TrialsRun_06_05_21_1612','HM21_RectJud_post_10TrialsRun_06_05_21_1626','long'};
%HM33 - long
files_rect(12,:)={'HM33_RectJud_pre_10TrialsRun_06_07_21_1022','HM33_RectJud_t1_10TrialsRun_06_07_21_1040'...
    'HM33_RectJud_t2_10TrialsRun_06_07_21_1612','HM33_RectJud_post_10TrialsRun_06_07_21_1629','long'};
%HM19 - short
files_rect(13,:)={'HM19_RectJud_pre_10TrialsRun_06_09_21_0942','HM19_RectJud_t1_10TrialsRun_06_09_21_1003'...
    'HM19_RectJud_t2_10TrialsRun_06_09_21_1720','HM19_RectJud_post_10TrialsRun_06_09_21_1738','short'};
%HM31 - short
files_rect(14,:)={'HM31_RectJud_pre_10TrialsRun_06_10_21_0859','HM31_RectJud_t1_10TrialsRun_06_10_21_0908'...
    'HM31_RectJud_t2_10TrialsRun_06_10_21_1703','HM31_RectJud_post_10TrialsRun_06_10_21_1714','short'};
%HM34 -short
files_rect(15,:)={'HM34_RectJud_pre_10TrialsRun_06_11_21_0922','HM34_RectJud_t1_10TrialsRun_06_11_21_0935',...
    'HM34_RectJud_t2_10TrialsRun_06_11_21_1710','HM34_RectJud_post_10TrialsRun_06_11_21_1722','short'};
% %HM44 - short (excluded)
% files_rect(16,:)={'HM44_RectJud_pre_10TrialsRun_06_14_21_0913','HM44_RectJud_t1_10TrialsRun_06_14_21_0937'...
%     'HM44_RectJud_t2_10TrialsRun_06_14_21_1723','HM44_RectJud_post_10TrialsRun_06_14_21_1746','short'};
%HM37 - short
files_rect(16,:)={'HM37_RectJud_pre_10TrialsRun_06_15_21_0933','HM37_RectJud_t1_10TrialsRun_06_15_21_0951',...
    'HM37_RectJud_t2_10TrialsRun_06_15_21_1714','HM37_RectJud_post_10TrialsRun_06_15_21_1734','short'};
% %HM39 - short (excluded)
% files_rect(18,:)={'HM39_RectJud_pre_10TrialsRun_06_16_21_0933','HM39_RectJud_t1_10TrialsRun_06_16_21_0956',...
%     'HM39_RectJud_t2_10TrialsRun_06_16_21_1724','HM39_RectJud_post_10TrialsRun_06_16_21_1745','short'};
%HM40 - short
files_rect(17,:)={'HM40_RectJud_pre_10TrialsRun_06_17_21_0949','HM40_RectJud_t1_10TrialsRun_06_17_21_1006'...
    'HM40_RectJud_t2_10TrialsRun_06_17_21_1714','HM40_RectJud_post_10TrialsRun_06_17_21_1735','short'};
%HM48 - long
files_rect(18,:)={'HM48_RectJud_pre_10TrialsRun_06_18_21_1130','HM48_RectJud_t1_10TrialsRun_06_18_21_1152',...
    'HM48_RectJud_t2_10TrialsRun_06_18_21_1724','HM48_RectJud_post_10TrialsRun_06_18_21_1745','long'};
%HM27 - short
files_rect(19,:)={'HM27_RectJud_pre_10TrialsRun_06_21_21_0943','HM27_RectJud_t1_10TrialsRun_06_21_21_1013',...
    'HM27_RectJud_t2_10TrialsRun_06_21_21_1717','HM27_RectJud_post_10TrialsRun_06_21_21_1742','short'};
%HM38 - short
files_rect(20,:)={'HM38_RectJud_pre_10TrialsRun_06_22_21_0935','HM38_RectJud_t1_10TrialsRun_06_22_21_0955',...
    'HM38_RectJud_t2_10TrialsRun_06_22_21_1716','HM38_RectJud_post_10TrialsRun_06_22_21_1739','short'};
%HM47 - long
files_rect(21,:)={'HM47_RectJud_pre_10TrialsRun_06_23_21_0920','HM47_RectJud_t1_10TrialsRun_06_23_21_0933',...
    'HM47_RectJud_t2_10TrialsRun_06_23_21_1511','HM47_RectJud_post_10TrialsRun_06_23_21_1531','long'};
%HM36 - short
files_rect(22,:)={'HM36_RectJud_pre_10TrialsRun_06_24_21_0937','HM36_RectJud_t1_10TrialsRun_06_24_21_0951',...
    'HM36_RectJud_t2_10TrialsRun_06_24_21_1718','HM36_RectJud_post_10TrialsRun_06_24_21_1736','short'};
%HM51 - long
files_rect(23,:)={'HM51_RectJud_pre_10TrialsRun_06_25_21_1053','HM51_RectJud_t1_10TrialsRun_06_25_21_1116',...
    'HM51_RectJud_t2_10TrialsRun_06_25_21_1646','HM51_RectJud_post_10TrialsRun_06_25_21_1705','long'};
%HM54 - short
files_rect(24,:)={'HM54_RectJud_pre_10TrialsRun_06_28_21_0900','HM54_RectJud_t1_10TrialsRun_06_28_21_0917',...
    'HM54_RectJud_t2_10TrialsRun_06_28_21_1710','HM54_RectJud_post_10TrialsRun_06_28_21_1722','short'};
%HM53 - long
files_rect(25,:)={'HM53_RectJud_pre_10TrialsRun_06_28_21_1022','HM53_RectJud_t1_10TrialsRun_06_28_21_1037',...
    'HM53_RectJud_t2_10TrialsRun_06_28_21_1611','HM53_RectJud_post_10TrialsRun_06_28_21_1626','long'};
%HM41 - short
files_rect(26,:)={'HM41_RectJud_pre_10TrialsRun_07_01_21_0931','HM41_RectJud_t1_10TrialsRun_07_01_21_0952',...
    'HM41_RectJud_t2_10TrialsRun_07_01_21_1718','HM41_RectJud_post_10TrialsRun_07_01_21_1742','short'};
%HM52 - long
files_rect(27,:)={'HM52_RectJud_pre_10TrialsRun_07_02_21_0825','HM52_RectJud_t1_10TrialsRun_07_02_21_0842',...
    'HM52_RectJud_t2_10TrialsRun_07_02_21_1410','HM52_RectJud_post_10TrialsRun_07_02_21_1424','long'};
%HM55 - short
files_rect(28,:)={'HM55_RectJud_pre_10TrialsRun_07_05_21_0953','HM55_RectJud_t1_10TrialsRun_07_05_21_1029',...
    'HM55_RectJud_t2_10TrialsRun_07_05_21_1724','HM55_RectJud_post_10TrialsRun_07_05_21_1748','short'};
%HM58 - long
files_rect(29,:)={'HM58_RectJud_pre_10TrialsRun_07_07_21_0929','HM58_RectJud_t1_10TrialsRun_07_07_21_0944'...
    'HM58_RectJud_t2_10TrialsRun_07_07_21_1519','HM58_RectJud_post_10TrialsRun_07_07_21_1530','long'};
%HM57 - short
files_rect(30,:)={'HM57_RectJud_pre_10TrialsRun_07_14_21_0942','HM57_RectJud_t1_10TrialsRun_07_14_21_1018',...
    'HM57_RectJud_t2_10TrialsRun_07_14_21_1729','HM57_RectJud_post_10TrialsRun_07_14_21_1808','short'};
%HM61 - control
files_rect(31,:)={'HM61_RectJud_pre_10TrialsRun_08_18_21_1320','HM61_RectJud_t1_10TrialsRun_08_18_21_1339',...
    'HM61_RectJud_t2_10TrialsRun_08_18_21_1453','HM61_RectJud_post_10TrialsRun_08_18_21_1507','control'};
%HM64
files_rect(32,:)={'HM64_RectJud_pre_10TrialsRun_08_31_21_1420','HM64_RectJud_t1_10TrialsRun_08_31_21_1434',...
    'HM64_RectJud_t2_10TrialsRun_08_31_21_1550','HM64_RectJud_post_10TrialsRun_08_31_21_1605','control'};
%HM65
files_rect(33,:)={'HM65_RectJud_pre_10TrialsRun_09_03_21_1456','HM65_RectJud_t1_10TrialsRun_09_03_21_1525',...
    'HM65_RectJud_t2_10TrialsRun_09_03_21_1648','HM65_RectJud_post_10TrialsRun_09_03_21_1708','control'};
% %HM63 (excluded)
% files_rect(34,:)={'HM63_RectJud_pre_10TrialsRun_09_06_21_0929','HM63_RectJud_t1_10TrialsRun_09_06_21_0944'...
%     'HM63_RectJud_t2_10TrialsRun_09_06_21_1115','HM63_RectJud_post_10TrialsRun_09_06_21_1129','control'};
%HM67
files_rect(34,:)={'HM67_RectJud_pre_10TrialsRun_09_07_21_1433','HM67_RectJud_t1_10TrialsRun_09_07_21_1445',...
    'HM67_RectJud_t2_10TrialsRun_09_07_21_1614','HM67_RectJud_post_10TrialsRun_09_07_21_1630','control'};
%HM69
files_rect(35,:)={'HM69_RectJud_pre_10TrialsRun_09_09_21_0925','HM69_RectJud_t1_10TrialsRun_09_09_21_0939',...
    'HM69_RectJud_t2_10TrialsRun_09_09_21_1245','HM69_RectJud_post_10TrialsRun_09_09_21_1259','control'};
%HM72
files_rect(36,:)={'HM72_RectJud_pre_10TrialsRun_09_13_21_1328','HM72_RectJud_t1_10TrialsRun_09_13_21_1339',...
    'HM72_RectJud_t2_10TrialsRun_09_13_21_1453','HM72_RectJud_post_10TrialsRun_09_13_21_1506','control'};
%HM73
files_rect(37,:)={'HM73_RectJud_pre_10TrialsRun_09_14_21_1502','HM73_RectJud_t1_10TrialsRun_09_14_21_1523',...
    'HM73_RectJud_t2_10TrialsRun_09_14_21_1647','HM73_RectJud_post_10TrialsRun_09_14_21_1701','control'};
%HM66
files_rect(38,:)={'HM66_RectJud_pre_10TrialsRun_09_17_21_0933','HM66_RectJud_t1_10TrialsRun_09_17_21_0949',...
    'HM66_RectJud_t2_10TrialsRun_09_17_21_1401','HM66_RectJud_post_10TrialsRun_09_17_21_1419','control'};
%HM81
files_rect(39,:)={'HM81_RectJud_pre_10TrialsRun_09_20_21_0943','HM81_RectJud_t1_10TrialsRun_09_20_21_0955',...
    'HM81_RectJud_t2_10TrialsRun_09_20_21_1411','HM81_RectJud_post_10TrialsRun_09_20_21_1426','control'};
%HM76
files_rect(40,:)={'HM76_RectJud_pre_10TrialsRun_09_22_21_1414','HM76_RectJud_t1_10TrialsRun_09_22_21_1433',...
    'HM76_RectJud_t2_10TrialsRun_09_22_21_1552','HM76_RectJud_post_10TrialsRun_09_22_21_1615','control'};
%HM83
files_rect(41,:)={'HM83_RectJud_pre_10TrialsRun_09_23_21_1427','HM83_RectJud_t1_10TrialsRun_09_23_21_1441',...
    'HM83_RectJud_t2_10TrialsRun_09_23_21_1559','HM83_RectJud_post_10TrialsRun_09_23_21_1615','control'};
%HM78
files_rect(42,:)={'HM78_RectJud_pre_10TrialsRun_09_24_21_0933','HM78_RectJud_t1_10TrialsRun_09_24_21_0953',...
    'HM78_RectJud_t2_10TrialsRun_09_24_21_1118','HM78_RectJud_post_10TrialsRun_09_24_21_1139','control'};
%HM74
files_rect(43,:)={'HM74_RectJud_pre_10TrialsRun_09_24_21_1420','HM74_RectJud_t1_10TrialsRun_09_24_21_1433',...
    'HM74_RectJud_t2_10TrialsRun_09_24_21_1548','HM74_RectJud_post_10TrialsRun_09_24_21_1600','control'};
%HM70
files_rect(44,:)={'HM70_RectJud_pre_10TrialsRun_09_28_21_1106','HM70_RectJud_t1_10TrialsRun_09_28_21_1119',...
    'HM70_RectJud_t2_10TrialsRun_09_28_21_1243','HM70_RectJud_post_10TrialsRun_09_28_21_1257','control'};
%HM82
files_rect(45,:)={'HM82_RectJud_pre_10TrialsRun_10_04_21_0925','HM82_RectJud_t1_10TrialsRun_10_04_21_0940',...
    'HM82_RectJud_t2_10TrialsRun_10_04_21_1214','HM82_RectJud_post_10TrialsRun_10_04_21_1229','control'};

%MEASURED IPD & Vertex distance
%the IPD used to generate the 3D scene is the average IPD, but we can use
%the actual measured IPD to correct the texture condition (see below).

ipds = [0.064,0.063,0.065,0.061,0.060,0.062,0.069,0.060,0.064,0.063,0.064,0.065,...
    0.069,0.060,0.058,0.057,0.058,0.061,0.063,0.063,0.061,0.061,0.064,0.067,...
    0.061,0.064,0.060,0.059,0.061,0.063,0.062,0.068,0.063,0.069,0.058,0.060,...
    0.062,0.061,0.060,0.067,0.062,0.065,0.060,0.071,0.064];


%----------------EXTRACT DATA FROM FILES---------------------------------
%extract raw data, averages, and SD etc for every condition
%each subject gets their own array with the SD and averages for each condition
%This also includes outlier removal

% for each subject
for Subj = 1:length(SubjIDs)
    
    Group{Subj} = files_slant{Subj,5};
    
    % loop over sessions
    for ses = 1:4 
        
        %SLANT - load the subjects files row=subj col=session
        slant_data = load(['../data/' files_slant{Subj,ses}]); %load slant data
        
        %create array for each condition with column = session (ie pre,t1,t2,post)
        % each subject indexed into the third dimension

        %PERSPECTIVE
        PerspR(:,ses,Subj)        = slant_data.data.slant_percieved_flat(:,1); %Raw data 
        [~,out_inds]              = rmoutliers(PerspR(:,ses,Subj),'median');% remove outliers
        Persp(:,ses,Subj)         = PerspR(:,ses,Subj);
        Persp(out_inds,ses,Subj)  = NaN;

        %DISPARITY
        DispR(:,ses,Subj)        = slant_data.data.slant_percieved_flat(:,2);
        [~,out_inds]             = rmoutliers(DispR(:,ses,Subj),'median');
        Disp(:,ses,Subj)         = DispR(:,ses,Subj);
        Disp(out_inds,ses,Subj)  = NaN;
        
        %DUAL CUE
        DualR(:,ses,Subj)        = slant_data.data.slant_percieved_flat(:,3);
        [~,out_inds]             = rmoutliers(DualR(:,ses,Subj),'median');
        Dual(:,ses,Subj)         = DualR(:,ses,Subj);
        Dual(out_inds,ses,Subj)  = NaN;
        
        %SHAPE JUDGEMENT - load subject files
        rect_data = load(['../data/' files_rect{Subj,ses}]); %loads rect data
        
        ShapeR(:,ses,Subj)        = rect_data.Rdat.RatioRightOverLeft(:,1);
        [~,out_inds]              = rmoutliers(ShapeR(:,ses,Subj),'median');
        Shape(:,ses,Subj)         = ShapeR(:,ses,Subj);
        Shape(out_inds,ses,Subj)  = NaN;

    end %end of session loop


end %subject loop

save('AllData.mat','SubjIDs','ipds','Group','session','PerspR','Persp','DispR','Disp','DualR','Dual','ShapeR','Shape');

