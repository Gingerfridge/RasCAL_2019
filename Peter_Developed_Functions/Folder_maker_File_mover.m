function Folder_maker_File_mover(folder_label)
folder_label_ext = string(strjoin(["C:\Users\mbcx4ph5\Dropbox (The University of Manchester)\PhD\RasCAL_2019\Folder_",folder_label],''));
filenames = files()
folder_label_star = string(strjoin([folder_label,"*"],''));
movefile( folder_label_star, folder_label_ext );

end
