{ osConfig, config, pkgs, ... }:
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
      ssh-generate-keys = "echo run: ssh-keygen -t rsa -b 2048 -C 'example@your-email.com'";
    };
    syntaxHighlighting = {
      enable = true;
    };
    initContent = ''
      eval "$(${pkgs.pay-respects}/bin/pay-respects --alias)"
    '';
  };
}
