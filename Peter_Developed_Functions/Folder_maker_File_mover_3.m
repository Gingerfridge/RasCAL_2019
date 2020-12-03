function Folder_maker_File_mover_3()

folder_label_ext = string(strjoin(["SLD_profiles"],''));
filenames = files()
folder_label_star = string(strjoin(["*SLD_AA_Hydrated_Profile.mat"],''));
copyfile( folder_label_star, folder_label_ext );

%folder_label_ext = string(strjoin(["SLD_profiles_Modified"],''));
%filenames = files()
%folder_label_star = string(strjoin(["*SLD_AA_Hydrated_Profile_Modified.mat"],''));
%copyfile( folder_label_star, folder_label_ext );

folder_label_Rascal = string(strjoin([folder_label_ext,"_Rascal"],''));
mkdir(folder_label_ext,folder_label_Rascal)

end
