{ pkgs, ... }:
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
    ];
    extraPackages = [
      pkgs.nixd
    ];
    userSettings = {
      features = {
        copilot = false;
      };
      telemetry = {
        metrics = false;
      };
      vim_mode = true;
    };
  };
}
