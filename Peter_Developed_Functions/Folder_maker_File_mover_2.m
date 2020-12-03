function Folder_maker_File_mover_2(folder_label,D2O_Frac,Hyd_Factor)

folder_label_ext = string(strjoin(["D2O_Frac_",D2O_Frac,"_Hyd_Factor_",Hyd_Factor,],''));
filenames = files()
folder_label_star = string(strjoin(["*.mat"],''));
movefile( folder_label_star, folder_label_ext );

folder_label_star = string(strjoin(["*.png"],''));
movefile( folder_label_star, folder_label_ext );
end
