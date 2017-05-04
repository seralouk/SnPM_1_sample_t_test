%%%%%%% SERAFEIM LOUKAS ALL RIGHTS RESERVED 2017 %%%%%%%%%%%%%%%%%%%%%
%-----------------------------------------------------------------------
% Job configuration created by cfg_util (rev $Rev: 4252 $)
%-----------------------------------------------------------------------
clear all;
close all;

matlabbatch{1}.spm.tools.snpm.des.OneSampT.DesignName = 'MultiSub: One Sample T test on diffs/contrasts';
matlabbatch{1}.spm.tools.snpm.des.OneSampT.DesignFile = 'snpm_bch_ui_OneSampT';
%The user has to select the desired directory to save the results.
f0 = spm_select([1 Inf],'dir','SELECT DIRECTORY TO SAVE THE RESULTS');
f0 = cellstr(f0);
matlabbatch{1}.spm.tools.snpm.des.OneSampT.dir = f0;
%matlabbatch{1}.spm.tools.snpm.des.OneSampT.dir = {'C:\Users\seral_000\Desktop\SNPM\SMOOTHED\one sample\M group\tempo vs original\label 2\'};
%%
% The user has to select the con images of the group
f1 = spm_select([1 Inf],'Image','NOW SELECT THE .CON IMAGES OF THE GROUP');
f1 = cellstr(f1);
matlabbatch{1}.spm.tools.snpm.des.OneSampT.P = f1;                                            
%%
matlabbatch{1}.spm.tools.snpm.des.OneSampT.cov = struct('c', {}, 'cname', {});
%choose number of permutations
matlabbatch{1}.spm.tools.snpm.des.OneSampT.nPerm = 5000;
%choose the desired FWHM for variance smoothing if degrees of freedom are few
matlabbatch{1}.spm.tools.snpm.des.OneSampT.vFWHM = [6 6 6];
matlabbatch{1}.spm.tools.snpm.des.OneSampT.bVolm = 1;
matlabbatch{1}.spm.tools.snpm.des.OneSampT.ST.ST_later = -1;
matlabbatch{1}.spm.tools.snpm.des.OneSampT.masking.tm.tm_none = 1;
matlabbatch{1}.spm.tools.snpm.des.OneSampT.masking.im = 1;
matlabbatch{1}.spm.tools.snpm.des.OneSampT.masking.em = {''};
matlabbatch{1}.spm.tools.snpm.des.OneSampT.globalc.g_omit = 1;
matlabbatch{1}.spm.tools.snpm.des.OneSampT.globalm.gmsca.gmsca_no = 1;
matlabbatch{1}.spm.tools.snpm.des.OneSampT.globalm.glonorm = 1;
matlabbatch{2}.spm.tools.snpm.cp.snpmcfg(1) = cfg_dep;
matlabbatch{2}.spm.tools.snpm.cp.snpmcfg(1).tname = 'SnPMcfg.mat configuration file';
matlabbatch{2}.spm.tools.snpm.cp.snpmcfg(1).tgt_spec = {};
matlabbatch{2}.spm.tools.snpm.cp.snpmcfg(1).sname = 'MultiSub: One Sample T test on diffs/contrasts: SnPMcfg.mat configuration file';
matlabbatch{2}.spm.tools.snpm.cp.snpmcfg(1).src_exbranch = substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{2}.spm.tools.snpm.cp.snpmcfg(1).src_output = substruct('.','SnPMcfg');
matlabbatch{3}.spm.tools.snpm.inference.SnPMmat(1) = cfg_dep;
matlabbatch{3}.spm.tools.snpm.inference.SnPMmat(1).tname = 'SnPM.mat results file';
matlabbatch{3}.spm.tools.snpm.inference.SnPMmat(1).tgt_spec = {};
matlabbatch{3}.spm.tools.snpm.inference.SnPMmat(1).sname = 'Compute: SnPM.mat results file';
matlabbatch{3}.spm.tools.snpm.inference.SnPMmat(1).src_exbranch = substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{3}.spm.tools.snpm.inference.SnPMmat(1).src_output = substruct('.','SnPM');
%define the CLUSTER-DEFINING-THRESHOLD giving p-value of T/F statistic
matlabbatch{3}.spm.tools.snpm.inference.Thr.Clus.ClusSize.CFth = 0.005;
matlabbatch{3}.spm.tools.snpm.inference.Thr.Clus.ClusSize.ClusSig.FWEthC = 0.05;
matlabbatch{3}.spm.tools.snpm.inference.Tsign = 1;
% Save the statistical maps as SnPM_filtered.nii
matlabbatch{3}.spm.tools.snpm.inference.WriteFiltImg.name = 'SnPM_filtered';
% If do not want to save the results as a nii then comment the above line
% and uncomment the below.
%matlabbatch{3}.spm.tools.snpm.inference.WriteFiltImg.WF_no = 0;
matlabbatch{3}.spm.tools.snpm.inference.Report = 'MIPtable';
%Run the job
save('SPM_analysis.mat','matlabbatch');
spm_jobman('initcfg'); 
spm_jobman('run','SPM_analysis.mat');