function [sucess,Ubuntu_Shell] = Ubuntu_Input_Script(MBS)

%set MBS to "yes" if you want general

if MBS == "MBS"

    [sucess,Ubuntu_Shell] = system("chmod +x MBS.sh");
    [sucess,Ubuntu_Shell] = system("wsl sh MBS.sh");

else

    Ubuntu_input = sprintf('%s %s','wsl sh',MBS);
    [sucess,Ubuntu_Shell] = system(Ubuntu_input);

end

end
