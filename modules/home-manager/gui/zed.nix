{ pkgs, lib, ... }:
{
  programs.zed-editor = {
    enable = true;
    package = pkgs.zed-editor;
    extensions = [
      "nix"
      "cpp2"
      "csharp"
      "sql"
      "ssh-config"
      "scss"
      "unocss"
      "jsonnet"
      "pylsp"
      "crates-lsp"
      "dockerfile"
      "toml"
      "java"
      "discord-presence"
      "catppuccin"
      "catppuccin-icons"
      "nu"
    ];
    extraPackages = [
      pkgs.nixd
      pkgs.nil
    ];
    userSettings = {
      features = {
        copilot = false;
      };
      telemetry = {
        metrics = false;
      };
      vim_mode = true;
      enable_language_server = true;
      formatter = "auto";
      icon_theme = lib.mkForce {
        light = "Catppuccin Frappe";
        dark = "Catppuccin Frappe";
      };
      theme = {
        light = lib.mkForce "Catppuccin Frappé";
        dark = lib.mkForce "Catppuccin Frappé";
      };
      editor = {
        tab_size = 1;
        insert_spaces = true;
        detect_indentation = false; # keep Zed from auto-overriding your size
        format_on_save = 1;
      };
      languages = {
        Nix = {
          format_on_save = "on";
        };
      };
    };
  };
}
