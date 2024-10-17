{
  inputs,
  pkgs,
  lib,
  ...
}:
{
  imports = [ inputs.nvf.homeManagerModules.default ];
    xdg.desktopEntries = {
    nvim = lib.mkForce {
      name = "Neovim";
      type = "Application";
      mimeType = [ "text/plain" ];

      icon = builtins.fetchurl {
        url = "https://raw.githubusercontent.com/NotAShelf/nvf/08547724e42a510e8917125ec86a879cc3013349/.github/assets/nvf-logo-work.svg";
        sha256 = "19n7n9xafyak35pkn4cww0s5db2cr97yz78w5ppbcp9jvxw6yyz3";
      };
      exec = "${pkgs.kitty}/bin/kitty nvim";
    };
    notepad = {
      name = "Quick Notes (tmp)";
      exec = "${pkgs.kitty}/bin/kitty nvim tmp.txt";
      icon = "notepad";
    };
  };
    programs.nvf = {
      enable = true;
      # your settings need to go into the settings attribute set
      # most settings are documented in the appendix
      settings = {
        vim = {
          viAlias = true;
          vimAlias = true;
          lineNumberMode = "number";
          useSystemClipboard = true;
          autopairs.enable = true;
          autocomplete.enable = true;
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
          rust = {
            enable = true;
            lsp.enable = true;
            treesitter.enable = true;
          };
          nix = {
            enable = true;
            lsp.enable = true;
            extraDiagnostics.enable = true;
            format = {
              enable = true;
              type = "nixpkgs-fmt";
            };
            treesitter.enable = true;
          };
          sql = {
            enable = true;
            lsp.enable = true;
            format.enable = true;
          };
          clang = {
            enable = true;
            lsp.enable = true;
            treesitter.enable = true;
            dap.enable = true;
          };
          ts = {
            enable = true;
            lsp.enable = true;
            format.enable = true;
            treesitter.enable = true;
          };
          python = {
            enable = true;
            lsp.enable = true;
            format.enable = true;
            treesitter.enable = true;
          };
          markdown = {
            enable = true;
            lsp.enable = true;
            format.enable = true;
            treesitter.enable = true;
          };
          html = {
            enable = true;
            treesitter.enable = true;
          };
          go = {
            enable = true;
            lsp.enable = true;
            treesitter.enable = true;
          };
          lua = {
            enable = true;
            lsp.enable = true;
            treesitter.enable = true;
          };
          dart = {
            enable = true;
            treesitter.enable = true;
            lsp.enable = true;
            flutter-tools.enable = true;
          };
          css = {
            enable = true;
            format.enable = true;
            lsp.enable = true;
            treesitter.enable = true;
          };
        };
        comments = {
          comment-nvim.enable = true;
        };
        dashboard = {
          alpha.enable = true;
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
        assistant = {
          copilot.enable = true;
        };
        # extraPlugins = {
        #   live-share = {
        #     package = pkgs.fetchFromGitHub {
        #       owner = "azratul";
        #       repo = "live-share.nvim";
        #       rev = "main";
        #       sha256 = "sha256-HYe8WZu5SCIV1ypZ/MxdfDe9SBQ5nPBb3zrk7dMccxI=";
        #     };
        #     setup = "require('live-share').setup {}";
        #     after = ["instant"];
        #   };
        #   instant = {
        #     package = pkgs.fetchFromGitHub {
        #       owner = "jbyuki";
        #       repo = "instant.nvim";
        #       rev = "master";
        #       sha256 = "sha256-HYe8WZu5SCIV1ypZ/MxdfDe9SBQ5nPBb3zrk7dMccxI=";
        #     };
        #     setup = "require('instant').setup {}";
        #   };
        # };
      };
    };
  };
}
