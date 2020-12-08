function SLD_plotter_multiple_var(Start_Contrast,End_Contrast,Start_Hydration,End_Hydraction,Contrast_Step,Hydraction_Step,box_x,box_y,Lower_thickness,Upper_thickness,flip)
%SLD_plotter_multiple_var(0,1,1,10,1,1,10,10,100)

%Hydraction_Step = (End_Hydraction-Start_Hydration)/Hydraction_Step_Number

for j = Start_Hydration:Hydraction_Step:End_Hydraction
  for i = Start_Contrast:Contrast_Step:End_Contrast
    fh = 1;
    [SLD_AA_Hydrated_Profile,V_frac_AA_Hydrated,VOLFRAC_Surface,VOLFRAC_Water,Hyd_Factor,V_TOT,V_TOT_unmodified,Total_AA_Mass,Total_AA_Mass_layer,Total_AA_Adsorbed,D2O_Frac] = SLD_Plot(i,box_x,box_y,fh,j,Lower_thickness,Upper_thickness,flip)
  end
end
