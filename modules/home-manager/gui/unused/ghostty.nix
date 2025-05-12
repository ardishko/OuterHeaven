{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    installVimSyntax = true;
    settings = {
      font-size = 13;
      theme = "catppuccin-frappe";
      font-family = "Iosevka Nerd Font";
      font-family-bold = "Iosevka Nerd Font Bold";
      font-family-italic = "Iosevka Nerd Font Italic";
      font-family-bold-italic = "Iosevka Nerd Font Italic Bold";
    };
    themes = {
      catppuccin-frappe = {
        palette = [
          "0=#51576d"
          "1=#e78284"
          "2=#a6d189"
          "3=#e5c890"
          "4=#8caaee"
          "5=#f4b8e4"
          "6=#81c8be"
          "7=#b5bfe2"
          "8=#626880"
          "9=#e78284"
          "10=#a6d189"
          "11=#e5c890"
          "12=#8caaee"
          "13=#f4b8e4"
          "14=#81c8be"
          "15=#a5adce"
        ];
        background = "303446";
        foreground = "c6d0f5";
        cursor-color = "f2d5cf";
        cursor-text = "303446";
        selection-background = "44494d";
        selection-foreground = "c6d0f5";
      };
    };
  };
}
