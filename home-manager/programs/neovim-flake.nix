{ inputs, pkgs, ... }:
{
    imports = [ inputs.neovim-flake.homeManagerModules.default ];
    programs.neovim-flake = {
        enable = true;
        settings = {
          vim = {
            vimAlias = true;
            viAlias = true;
            languages = {
              nix.enable = true;
              rust.enable = true;
              html.enable = true;
              ts.enable = true;
              lua.enable = true;
            };
          };
        };
    };
}
