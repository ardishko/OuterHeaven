{
  lib,
  stdenv,
  fetchFromGitHub,
}:

stdenv.mkDerivation {
  pname = "live-share-nvim";
  version = "unstable-2024-09-24";

  src = fetchFromGitHub {
    owner = "azratul";
    repo = "live-share.nvim";
    rev = "d611857f3afe4ff8a393a331594adfa0e4241e56";
    hash = "sha256-HYe8WZu5SCIV1ypZ/MxdfDe9SBQ5nPBb3zrk7dMccxI=";
  };

  meta = {
    description = "Creates a \"Live Share\" server in Neovim, similar to the Visual Studio Code Live Share functionality";
    homepage = "https://github.com/azratul/live-share.nvim";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "live-share-nvim";
    platforms = lib.platforms.all;
  };
}
