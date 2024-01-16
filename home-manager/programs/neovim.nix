{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.nixvim.homeManagerModules.nixvim];
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    package = pkgs.neovim-unwrapped;
    enableMan = true;
    colorscheme = "catppuccin";
    colorschemes.catppuccin = {
      enable = true;
      flavour = "frappe";
      transparentBackground = true;
    };
    plugins = {
      treesitter.enable = true;
      alpha.enable = true;
      nix.enable = true;
      better-escape.enable = true;
      undotree.enable = true;
      which-key.enable = true;
      comment-nvim.enable = true;
      nvim-tree.enable = true;
      telescope.enable = true;
      nvim-colorizer.enable = true;
      lualine.enable = true;
      lspkind.enable = true;
      vim-bbye.enable = true;
      cursorline.enable = true;
      barbecue.enable = true;
      airline.enable = true;
    };
    extraPlugins = [
      inputs.nixpkgs-stable.legacyPackages.x86_64-linux.vimPlugins.nvchad
    ];
  };
}
