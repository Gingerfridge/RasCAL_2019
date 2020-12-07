function [SLD_AA_Hydrated_Profile,V_frac_AA_Hydrated,VOLFRAC_Surface,VOLFRAC_Water,Hyd_Factor,V_TOT,V_TOT_unmodified,Total_AA_Mass,Total_AA_Mass_layer,Total_AA_Adsorbed,D2O_Frac] = SLD_Plot(D2O_Frac,box_x,box_y,fh,HYD_factor,Lower_thickness,Upper_thickness)
 %upper thickness cuts a SLD profile for matlab
R = gaussmf(D2O_Frac,[0.4 1]);
G = gaussmf(D2O_Frac,[0.25 0.5]);
B = gaussmf(D2O_Frac,[0.4 0]);



    [SLD_AA_Hydrated_Profile,V_frac_AA_Hydrated,VOLFRAC_Surface,VOLFRAC_Water,Hyd_Factor,V_TOT,V_TOT_unmodified,Total_AA_Mass,Total_AA_Mass_layer,Total_AA_Adsorbed,Output,SL,filenames,Logic_matrix,MATRIX,SLD_AA,OUTPUT,SLD_AA_Profile,OUTPUT_V,Misc_Matrix,Misc_OUTPUT,Misc_OUTPUT_V,V_TOT_AA] = SLDfunction_HYD(D2O_Frac,box_x,box_y,HYD_factor);
    SLD_AA_Hydrated_Profile(:,1)=10*SLD_AA_Hydrated_Profile(:,1)  % convert to angstoms
    m = SLD_AA_Profile(:,1);
    a = m(1:find(m,1,'last'));
  %  Upper_thickness = a(1,end);

    SLD_AA_Hydrated_Profile = SLD_AA_Hydrated_Profile(SLD_AA_Hydrated_Profile(:,1) <= Upper_thickness, :)% convert to angstoms
    V_frac_AA_Hydrated = V_frac_AA_Hydrated(SLD_AA_Hydrated_Profile(:,1) <= Upper_thickness, :)
    VOLFRAC_Surface= VOLFRAC_Surface(SLD_AA_Hydrated_Profile(:,1) <= Upper_thickness, :)
    VOLFRAC_Water = VOLFRAC_Water(SLD_AA_Hydrated_Profile(:,1) <= Upper_thickness, :)


    fh = 1;
    s_x = 20;
    s_y =570;
    x = 1860/2;
    y = 410;
    pubgraph(fh,s_x, s_y, x, y)
    fig_1 = plot(SLD_AA_Hydrated_Profile(:,1),SLD_AA_Hydrated_Profile(:,2),'color',[R G B]);
    pubgraph(fh,s_x, s_y, x, y)
    Ang = char(197);
    xlabel(strjoin(["Distance (" Ang ")"],' '))
    Graph_1 = string(strjoin(["D2O_Frac_",D2O_Frac,"_Hyd_Factor_",Hyd_Factor,"_SLD_profile_full.png"],''));
    saveas(gcf,Graph_1)

    fh = 2;
    s_x = 970;
    s_y = 60;
    x = 1860/2;
    y = 410;
    pubgraph(fh,s_x, s_y, x, y)
    fig_2 = plot(SLD_AA_Profile(:,1),SLD_AA_Profile(:,2),'color',[R G B]);
    pubgraph(fh,s_x, s_y, x, y);
    xlabel(strjoin(["Distance (" Ang ")"],' '))
    ylabel(strjoin(["SLD (" Ang ")"],' '))
    Graph_2 = string(strjoin(["D2O_Frac_",D2O_Frac,"_Hyd_Factor_",Hyd_Factor,"_SLD_profile_AA.png"],''));
    saveas(gcf,Graph_2)


    fh = 3;
    s_x = 20;
    s_y = 60;
    x = 1860/2;
    y = 410;
    pubgraph(fh,s_x, s_y, x, y)
    a = [V_frac_AA_Hydrated, VOLFRAC_Surface, VOLFRAC_Water];
    fig_3 = bar(SLD_AA_Hydrated_Profile(:,1),a,1,'stacked','FaceColor','flat');
    pubgraph(fh,s_x, s_y, x, y)
    xlabel(strjoin(["Distance (" Ang ")"],' '))
    for i = 1:21
        fig_3(i).FaceColor = [gaussmf(i/20,[0.4 1]) 0 0];
    end
    fig_3(22).FaceColor = [0.1 0.1 0.1];
    fig_3(23).FaceColor = [0 0.2 0.4];
    Graph_3 = string(strjoin(["D2O_Frac_",D2O_Frac,"_Hyd_Factor_",Hyd_Factor,"_Vol_frac_profile_full.png"],''));
    saveas(gcf,Graph_3)



%     pubgraph(fh+2)
%     plot(SLD_AA_Hydrated_Profile(:,2),SLD_AA_Hydrated_Profile(:,1),'color',[R G B]);
%     pubgraph(fh+2)
%     movegui('northwest')

Label1 = string(strjoin(["D2O_Frac_",D2O_Frac,"_Hyd_Factor_",Hyd_Factor,"_Total_AA_Adsorbed.mat"],''));
Label2 = string(strjoin(["D2O_Frac_",D2O_Frac,"_Hyd_Factor_",Hyd_Factor,"_VOLFRAC_Water.mat"],''));
Label3 = string(strjoin(["D2O_Frac_",D2O_Frac,"_Hyd_Factor_",Hyd_Factor,"_VOLFRAC_Surface.mat"],''));
Label4 = string(strjoin(["D2O_Frac_",D2O_Frac,"_Hyd_Factor_",Hyd_Factor,"_V_frac_AA_Hydrated.mat"],''));
Label5 = string(strjoin(["D2O_Frac_",D2O_Frac,"_Hyd_Factor_",Hyd_Factor,"_SLD_AA_Hydrated_Profile.mat"],''));


save(Label1,'Total_AA_Adsorbed');
save(Label2,'VOLFRAC_Water');
save(Label3,'VOLFRAC_Surface');
save(Label4,'V_frac_AA_Hydrated');
save(Label5,'SLD_AA_Hydrated_Profile');


Folder_maker_File_mover_3();
Folder_maker_File_mover_2('''',D2O_Frac,Hyd_Factor);


close all
  % D2O frac box_x box_y 1 Opt_Hyd HYD_factor (0 no hydration, 1 hydration
  % of sim, >1 more hydration compared to sim)
end
