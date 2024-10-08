{
  inputs,
  pkgs,
  lib,
  ...
}:
{
  imports = [ inputs.nvf.homeManagerModules.default ];
    programs.nvf = {
      enable = true;
      # your settings need to go into the settings attribute set
      # most settings are documented in the appendix
      settings = {
        vim = {
          viAlias = false;
          vimAlias = true;
          useSystemClipboard = true;
          theme = { 
            enable = true;
            name = "catppuccin";
            style = "frappe";
          };
          lsp = {
          enable = true;
          };
        spellcheck.enable = true;
        splitBelow = true;
        telescope = {
          enable = true;
          mappings = {
            findFiles = "<C-l>";
          };
        };
        languages = {
          rust.enable = true;
          nix.enable = true;
          sql.enable = true;
          clang.enable = true;
          ts.enable = true;
          python.enable = true;
          markdown.enable = true;
          html.enable = true;
          go.enable = true;
          lua.enable = true;
          dart.enable = true;
        };
        comments = {
          comment-nvim.enable = true;
        };
        dashboard = {
          dashboard-nvim.enable = true;
        };
        presence = {
          neocord.enable = true;
        };
        projects = {
          project-nvim.enable = true;
        };
        filetree = {
          nvimTree = {
            enable = true;
            openOnSetup = false;
            mappings.toggle = "<C-s>";
          };
        };
        statusline = {
          lualine.enable = true;
        };
      };
    };
  };
}
