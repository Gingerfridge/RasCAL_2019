function [sucess,Ubuntu_Shell,folder_label] = MATLAB_Number_Density_Producer()
%run after producting xtc file and .sh script
% note you need a number density script for each folder
[sucess,Ubuntu_Shell] = Ubuntu_Input_Script('NumberDensity.sh')
data_label = readtable('Data_label');
folder_label = data_label.Properties.VariableNames{1,1};
Folder_maker_File_mover(folder_label)
%SLD_plotter_multiple_var is the next function you want to use
