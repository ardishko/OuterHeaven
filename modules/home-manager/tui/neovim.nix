{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [inputs.nixvim.homeManagerModules.nixvim];
  xdg.desktopEntries = {
    nvim = lib.mkForce {
      name = "Neovim";
      type = "Application";
      mimeType = ["text/plain"];

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
  programs.nixvim = {
    enable = true;
    options = {
      number = true;
    };
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    package = pkgs.neovim-unwrapped;
    enableMan = false;
    clipboard.register = "unnamedplus";
    colorscheme = "catppuccin";
    colorschemes.catppuccin = {
      enable = true;
      flavour = "frappe";
      transparentBackground = true;
    };
    plugins = {
      treesitter = {
        enable = true;
        ensureInstalled = [
          "all"
        ];
        nixvimInjections = true;
        };
        lsp = {
          enable = true;
          servers = {
            bashls.enable = true;
            lua-ls.enable = true;
            tsserver.enable = true;
            # pylyzer.enable = true;
            # rust-analyzer = {
            #   enable = true;
            #   installCargo = false;
            #   installRustc = false;
            # };
          };
        };
      alpha = {
        enable = true;
        theme = null;

        layout = [
          {
          opts = {
            position = "center";
            hl = "Type";
          };
            type = "text";
            val = [
        "                                                "
        " ███▄    █  ██▓▒██   ██▒ ██▒   █▓ ██▓ ███▄ ▄███▓"
        " ██ ▀█   █ ▓██▒▒▒ █ █ ▒░▓██░   █▒▓██▒▓██▒▀█▀ ██▒"
        "▓██  ▀█ ██▒▒██▒░░  █   ░ ▓██  █▒░▒██▒▓██    ▓██░"
        "▓██▒  ▐▌██▒░██░ ░ █ █ ▒   ▒██ █░░░██░▒██    ▒██ "
        "▒██░   ▓██░░██░▒██▒ ▒██▒   ▒▀█░  ░██░▒██▒   ░██▒"
        "░ ▒░   ▒ ▒ ░▓  ▒▒ ░ ░▓ ░   ░ ▐░  ░▓  ░ ▒░   ░  ░"
        "░ ░░   ░ ▒░ ▒ ░░░   ░▒ ░   ░ ░░   ▒ ░░  ░      ░"
        "   ░   ░ ░  ▒ ░ ░    ░       ░░   ▒ ░░      ░   "
        "         ░  ░   ░    ░        ░   ░         ░   "
        "                                                "
            ];
          }
        ];
      };

      nvim-tree = {
        enable = true;
        autoClose = true;
      };
      nix.enable = true;
      better-escape.enable = true;
      undotree.enable = true;
      which-key.enable = true;
      comment-nvim.enable = true;
      telescope.enable = true;
      nvim-colorizer.enable = true;
      lualine.enable = true;
      lspkind.enable = true;
      vim-bbye.enable = true;
      cursorline.enable = true;
      barbecue.enable = true;
      airline.enable = true;
      neo-tree.enable = true;
      gitsigns.enable = true;
      image.enable = true;
      # neorg.enable = true;
      multicursors.enable = true;
      neocord.enable = true;
      oil.enable = true;
    };
    globals = {
        mapleader = " ";
      };
    keymaps = [
      {
        action = "<cmd>Neotree<CR>";
        key = "<C-s>";
      }
      {
        action = "<cmd>Telescope find_files<CR>";
        key = "<C-l>";
      }
    ];
  };
}
