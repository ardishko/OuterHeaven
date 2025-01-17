{ osConfig, config, ... }:
{
  programs.zsh = {
    enable = true;
    autosuggestion = {
      enable = true;
      strategy = [
        "completion"
      ];
    };
    enableCompletion = true;
    oh-my-zsh = {
      enable = true;
      theme = "duellj";
    };
    shellAliases = {
      ll = "ls -l";
      ".." = "cd ..";
      rebuild = "nh os switch ~/NixOS/OuterHeaven";
      rebuild-boot = "nh os boot /home/${
        osConfig.users.users.${config.home.username}.description
      }/NixOS/OuterHeaven";
    };
    syntaxHighlighting = {
      enable = true;
    };
  };
}
