{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    installVimSyntax = true;
    settings = {
      theme = "Catppuccin Frappe";
      font-size = "13";
      term = "xterm-256color";
    };
  };
}
