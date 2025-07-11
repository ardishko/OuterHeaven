{ pkgs, config, ... }:
let
  userName =
    if (config.networking.hostName == "ShadowMoses") then
      "vaporsnake"
    else if (config.networking.hostName == "BigShell") then
      "liquid"
    else if (config.networking.hostName == "Tanker") then
      "raiden"
    else if (config.networking.hostName == "jd") then
      "snake"
    else if (config.networking.hostName == "Kamurocho") then
      "majima"
    else
      "user";
in
{
  # Define a user account. Don't forget to set a password by creating an encrypted file at the relevant location.
  users.users.${userName} = {
    isNormalUser = true;
    description = "${userName}";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true;
  };
}
