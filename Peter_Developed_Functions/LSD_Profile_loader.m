function [file_names] = LSD_Profile_loader(data_directory)
% this function loads the SLDprofile produced but SLD_plotter_multiple_var
% it can be used to load differnt files depending on the params input from matlab hence being used for data fitting
%two versions will be made one coarse fitting with a rounding of 1 for hydraction and a coarse one with rounding of 0.01 to be run after finding a ball park figure
working_directory = pwd;
cd(data_directory)
file_names = files_mat();
cd(working_directory)
end
