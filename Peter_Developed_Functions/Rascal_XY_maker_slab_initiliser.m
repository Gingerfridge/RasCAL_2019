function [xx,yy] = Rascal_XY_maker_slab_initiliser(params,bulk_in,bulk_out,contrast,starting_params_number)

working_dir = pwd;
cd ..
cd ..


% D2O_Frac = params(2*i+starting_params_number);
D2O_Frac = bulk_out(1,contrast)/6.35e-6;
Hydration = params(starting_params_number);
for i = 1:contrast
%need to convert hydration to the same scale as 'Hydration variable'
%change the rounding for more pricise 
D2O_Frac = round(D2O_Frac,0);
Hydration = round(Hydration,0);
st_val = bulk_in(contrast);
end_val = bulk_out(contrast);


[file_names,D2O_frac_list,Hydration_list] = get_Data(pwd);

%insert logic to serch for the best fit here
size_Dataset = size(D2O_frac_list);



for k = 1:size_Dataset(1,1)
    if D2O_frac_list(k,1) == D2O_Frac
        D2O_logic(k,1) = 1;
    else
        D2O_logic(k,1) = 0;
    end
end

for k = 1:size_Dataset(1,1)
    if Hydration_list(k,1) == Hydration
        Hydration_logic(k,1) = 1;
    else
        Hydration_logic(k,1) = 0;
    end
end

Winner = Hydration_logic & D2O_logic;

WINNER = find(Winner, 1, 'first');

SLD_AA_Hydrated_Profile_struct = load(file_names{WINNER,1});

SLD_AA_Hydrated_Profile = SLD_AA_Hydrated_Profile_struct.SLD_AA_Hydrated_Profile;

xx = 0:SLD_AA_Hydrated_Profile(end,1);
x = SLD_AA_Hydrated_Profile(:,1);
y = SLD_AA_Hydrated_Profile(:,2);
%yy = spline(x,y,xx);
yy = pchip(x,y,xx);
end
cd(working_dir)
