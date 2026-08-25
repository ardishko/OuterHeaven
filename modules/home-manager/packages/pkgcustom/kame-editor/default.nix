{
  qt6,
  callPackage,
  vgmstream,
}:

# qmake, qtbase and wrapQtAppsHook do NOT exist at the top level of nixpkgs;
# they live only under the qt6 scope, so package.nix must be built with
# qt6.callPackage (a bare callPackage fails with `required argument "qmake"`).
#
# kame-tools (build/deploy themes) and rstmcpp (wav -> theme audio) are the CLI
# backends kame-editor shells out to. Neither is in nixpkgs, so we build them
# here and put them on kame-editor's runtime PATH. Without kame-tools the editor
# cannot make a theme at all; without rstmcpp audio conversion is disabled.
let
  kame-tools = callPackage ./kame-tools.nix { };
  rstmcpp = callPackage ./rstmcpp.nix { };
in
qt6.callPackage ./package.nix {
  inherit vgmstream kame-tools rstmcpp;
}
