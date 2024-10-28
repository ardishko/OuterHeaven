{ pkgs, username, ... }:
{
  # Define a user account. Don't forget to set a password by creating an encrypted file at the relevant location.
  users.users.${username} = {
    isNormalUser = true;
    description = "${username}";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true;
  };
}
