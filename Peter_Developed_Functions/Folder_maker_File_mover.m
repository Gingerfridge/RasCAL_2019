function Folder_maker_File_mover(folder_label)
folder_label_ext = string(strjoin(["Folder_",folder_label],''));
filenames = files()
folder_label_star = string(strjoin([folder_label,"*"],''));
movefile( folder_label_star, folder_label_ext );

end
