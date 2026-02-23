{
  osConfig,
  config,
  pkgs,
  ...
}:
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
      _cmd_start_time=0
      preexec() {
        _cmd_start_time=$SECONDS
      }
      precmd() {
        local elapsed=$(( SECONDS - _cmd_start_time ))
        if (( elapsed >= 10 && _cmd_start_time > 0 )); then
          ${pkgs.libnotify}/bin/notify-send "Terminal" "Command finished (''${elapsed}s)"
        fi
        _cmd_start_time=0
      }
      sudo() {
        if ! command sudo -n true 2>/dev/null; then
          ${pkgs.libnotify}/bin/notify-send "Terminal" "Password required"
        fi
        command sudo "$@"
      }
    '';
  };
}
