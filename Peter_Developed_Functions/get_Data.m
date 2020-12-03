function [file_names,D2O_frac,Hydration] = get_Data(data_directory)

[file_names] = LSD_Profile_loader(data_directory);
num_files = size(file_names);
for i = 1:num_files(1,2)
  str = file_names{1,i};
  D2O_frac_str(i) = extractBetween(str,"Frac_","_Hyd");
  D2O_frac(i) = str2double(D2O_frac_str(i));
  Hydration_str(i) = extractBetween(str,"Factor_","_SLD");
  Hydration(i) = str2double(Hydration_str(i));
end
file_names = transpose(file_names);
Hydration = transpose(Hydration);
D2O_frac = transpose(D2O_frac);

end
