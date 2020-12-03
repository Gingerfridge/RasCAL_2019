function [Total_AA_Mass,Total_AA_Mass_layer,Total_AA_Adsorbed]  = adsorbed_mass(OUTPUT_M,Hyd_Factor,box_x,box_y)
nucleaon_mass = 1.6605*10.^-27;
%kg/nm^2 -> mg/m^2 
units = 10.^24;
Total_AA_Mass_layer = sum(OUTPUT_M,2)./Hyd_Factor*nucleaon_mass;

Total_AA_Mass = sum(Total_AA_Mass_layer);

Total_AA_Adsorbed = sum(Total_AA_Mass_layer)/(box_x*box_y)*units;