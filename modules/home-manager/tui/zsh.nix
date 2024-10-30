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
    };
    syntaxHighlighting = {
      enable = true;
    };
    # zplug = {
    #   enable = true;
    # };
  };
}
