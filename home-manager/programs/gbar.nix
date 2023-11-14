{ pkgs, inputs, ... }:

{
    imports = [ inputs.gBar.homeManagerModules.x86_64-linux.default ];
    programs.gBar = {
        enable = true;
    };
}