{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.nixvim.homeManagerModules.nixvim];
  programs.nixvim = {
    enable = true;
    options = {
      number = true;
    };
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    package = pkgs.neovim-unwrapped;
    enableMan = true;
    clipboard.register = "unnamedplus";
    colorscheme = "catppuccin";
    colorschemes.catppuccin = {
      enable = true;
      flavour = "frappe";
      transparentBackground = true;
    };
    plugins = {
      treesitter.enable = true;
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
        " ███▄    █  ██▓▒██   ██▒ ██▒   █▓ ██▓ ███▄ ▄███▓"
        " ██ ▀█   █ ▓██▒▒▒ █ █ ▒░▓██░   █▒▓██▒▓██▒▀█▀ ██▒"
        "▓██  ▀█ ██▒▒██▒░░  █   ░ ▓██  █▒░▒██▒▓██    ▓██░"
        "▓██▒  ▐▌██▒░██░ ░ █ █ ▒   ▒██ █░░░██░▒██    ▒██ "
        "▒██░   ▓██░░██░▒██▒ ▒██▒   ▒▀█░  ░██░▒██▒   ░██▒"
        "░ ▒░   ▒ ▒ ░▓  ▒▒ ░ ░▓ ░   ░ ▐░  ░▓  ░ ▒░   ░  ░"
        "░ ░░   ░ ▒░ ▒ ░░░   ░▒ ░   ░ ░░   ▒ ░░  ░      ░"
        "   ░   ░ ░  ▒ ░ ░    ░       ░░   ▒ ░░      ░   "
        "         ░  ░   ░    ░        ░   ░         ░   "
        "                             ░                  "
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
      presence-nvim.enable = true;
      gitsigns.enable = true;
      image.enable = true;
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
      {
        action = "<cmd>set number<CR>";
        key = "<C-n>";
      }
    ];
  };
}