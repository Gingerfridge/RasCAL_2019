function [SLD_AA_Hydrated_Profile,V_frac_AA_Hydrated,VOLFRAC_Surface,VOLFRAC_Water,Hyd_Factor,V_TOT,V_TOT_unmodified,Total_AA_Mass,Total_AA_Mass_layer,Total_AA_Adsorbed,Output,SL,filenames,Logic_matrix,MATRIX,SLD_AA,OUTPUT,SLD_AA_Profile,OUTPUT_V,Misc_Matrix,Misc_OUTPUT,Misc_OUTPUT_V,V_TOT_AA] = SLDfunction_HYD(D2O_Frac,box_x,box_y,HYD_factor)
% Loads xvg files from the current folder
filenames = files();

% define the number of files being read in
a = size(filenames);

%Calculate the amino acid properties from deuteration
[SL] = amino_acid_SL(D2O_Frac,0,0.9);

%defining the order the AA are in the data file (referenced)
SL(1,7)= "GLY";
SL(2,7)= "ALA";
SL(3,7)= "VAL";
SL(4,7)= "LEU";
SL(5,7)= "ILE";
SL(6,7)= "PHE";
SL(7,7)= "TYR";
SL(8,7)= "TRP";
SL(9,7)= "ASP";
SL(10,7)= "GLU";
SL(11,7)= "SER";
SL(12,7)= "THR";
SL(13,7)= "ASN";
SL(14,7)= "GLN";
SL(15,7)= "LYS";
SL(16,7)= "ARG";
SL(17,7)= "HIS";
SL(18,7)= "MET";
SL(19,7)= "CYS";
SL(20,7)= "PRO";


%volume of the amino acids
SL(:,8) = [89.9000000000000;117.800000000000;168.800000000000;198;175.700000000000;219.700000000000;221.200000000000;257.900000000000;145.400000000000;170.900000000000;121.700000000000;148.300000000000;145.400000000000;175.100000000000;181;218.200000000000;186.300000000000;195.200000000000;135.400000000000;153.300000000000];
SLD_AA = str2double(SL(:,5));


for j = 1:a(1,2)
str = filenames{1,j};

    GLY(1,j) = contains(str,"GLY");
    ALA(1,j) = contains(str,"ALA");
    VAL(1,j) = contains(str,"VAL");
    LEU(1,j) = contains(str,"LEU");
    ILE(1,j) = contains(str,"ILE");
    PHE(1,j) = contains(str,"PHE");
    TYR(1,j) = contains(str,"TYR");
    TRP(1,j) = contains(str,"TRP");
    ASP(1,j) = contains(str,"ASP");
    GLU(1,j) = contains(str,"GLU");
    SER(1,j) = contains(str,"SER");
    THR(1,j) = contains(str,"THR");
    ASN(1,j) = contains(str,"ASN");
    GLN(1,j) = contains(str,"GLN");
    LYS(1,j) = contains(str,"LYS");
    ARG(1,j) = contains(str,"ARG");
    HIS(1,j) = contains(str,"HIS");
    MET(1,j) = contains(str,"MET");
    CYS(1,j) = contains(str,"CYS");
    PRO(1,j) = contains(str,"PRO");

    %input the name of non AA residues here they will be out put in the
    %porder put in with the layer distance in misc_Ouput!
    GRAP(1,j) = contains(str,"AUM");
 
    PW(1,j) = contains(str,"SOL");
  
end
GRAP_SLD = 0e-6;
GRAP_Vol = 169.3 ;
PW_SLD = (6.35e-6+0.56e-6)*D2O_Frac-0.56e-6;
PW_Vol = 29.9; %A^3 actually all volumes should be for H2O (29.9+D2O_Frac*7 if you want variable volumes)

Misc_Volumes = transpose([GRAP_Vol; PW_Vol]);

Logic_matrix = transpose([GLY; ALA; VAL; LEU; ILE; PHE; TYR; TRP; ASP; GLU; SER; THR; ASN; GLN; LYS; ARG; HIS; MET; CYS; PRO]);



Misc_Logic_matrix = transpose([GRAP; PW]);



for k = 1:a(1,2)
    Matrix(k,:) = Logic_matrix(k,:)*k;
end

for k = 1:a(1,2)
    Misc_Matrix(k,:) = Misc_Logic_matrix(k,:)*k;
end



Misc_MATRIX = sum(Misc_Matrix,1);
MATRIX = sum(Matrix,1);

b = size(Misc_MATRIX);

for i = 1:b(1,2)
    input = Misc_MATRIX(i);

    if input == 0
    else
        Data = importfile(filenames{1,Misc_MATRIX(i)});
        Misc_Output(:,i+1) = Data (:,2);
        Misc_Output(:,1) = Data(:,1);
    end

    i=i+1;
end

for m = 1:b(1,2)
    Misc_OUTPUT(:,m+1) = Misc_Output(:,m+1)*(Misc_Output(3,1)-Misc_Output(2,1))*box_x*box_y;

end

for p = 1:b(1,2)
    Misc_OUTPUT_V(:,p+1) = Misc_OUTPUT(:,p+1)*Misc_Volumes(p);

end

a = Misc_OUTPUT_V(:,3);
MIN_Hyd = min(a(a > 0));
% MIN_Hyd = 200;
%
% Misc_OUTPUT_V(:,3) = Misc_OUTPUT_V(:,3);
%
% Misc_OUTPUT_V(:,2) = Misc_OUTPUT_V(:,2);

Misc_OUTPUT_V( Misc_OUTPUT_V <= 0 ) = 0;


for i = 1:20 %number of AA
    input = MATRIX(i);

    if input == 0
    else
        Data = importfile(filenames{1,MATRIX(i)});
        Output(:,i+1) = Data (:,2);

    end
    Output(:,1) = Data(:,1);
    i=i+1;
end

for m = 1:20
    OUTPUT(:,m+1) = Output(:,m+1)*(Output(3,1)-Output(2,1))*box_x*box_y;

end

% volumes of the amino acids times the number of the amino acids in each
% slice
for p = 1:20
    OUTPUT_V(:,p+1) = OUTPUT(:,p+1)*str2double(SL(p,8));

end
% mass of the amino acids times the number of the amino acids in each
% slice
for p = 1:20
    OUTPUT_M(:,p+1) = OUTPUT(:,p+1)*str2double(SL(p,6));

end


Slice_Thick = (Output(3,1)-Output(2,1));
% Slice_Vol = (Output(3,1)-Output(2,1))*box_x*box_y*100;
Slice_Vol_water = sum(Misc_OUTPUT_V(:,3));
Hyd_Factor = HYD_factor;%*(Slice_Vol_water-MIN_Hyd)/Slice_Vol_water;



V_TOT_AA = sum(OUTPUT_V,2);

V_frac_AA = OUTPUT_V./V_TOT_AA;

V_TOT = V_TOT_AA+ Hyd_Factor*Misc_OUTPUT_V(:,3)+Hyd_Factor*Misc_OUTPUT_V(:,2);
V_TOT_unmodified = V_TOT_AA+ Misc_OUTPUT_V(:,3) + Misc_OUTPUT_V(:,2);

V_frac_AA_Hydrated = OUTPUT_V./V_TOT;

Surface_volfrac = Misc_OUTPUT_V(:,2)./V_TOT;



for p = 1:20
    Frac_SLD(:,p+1) = V_frac_AA(:,p+1)*str2double(SL(p,5));

end

for p = 1:20
    Frac_SLD_Hydrated(:,p+1) = V_frac_AA_Hydrated(:,p+1)*str2double(SL(p,5));

end

VOLFRAC_Water = Hyd_Factor*Misc_OUTPUT_V(:,3)./V_TOT;
VOLFRAC_AA = sum(V_frac_AA_Hydrated,2);
VOLFRAC_Surface = Hyd_Factor*sum(Surface_volfrac,2);
% Hydraction = 1-VOLFRAC_AA-VOLFRAC_Surface;



Output_2 = Output*(Output(3,1)-Output(2,1));
Output_2(:,1) = [];

weight = sum(Output_2,2);
SLD_AA_Profile(:,1) = Output(:,1);
SLD_AA_Profile(:,2) = sum(Frac_SLD,2);

SLD_AA_Hydrated_Profile(:,1) = Output(:,1);
SLD_AA_Hydrated_Profile(:,2) = sum(Frac_SLD_Hydrated,2)+VOLFRAC_Water*PW_SLD+VOLFRAC_Surface*GRAP_SLD;


%N_SLD_AA_Profile(:,1) = Output(:,1);
%N_SLD_AA_Profile(:,2) = sum(OUTPUT,2);

[Total_AA_Mass,Total_AA_Mass_layer,Total_AA_Adsorbed]  = adsorbed_mass(OUTPUT_M,Hyd_Factor,box_x,box_y);

end
