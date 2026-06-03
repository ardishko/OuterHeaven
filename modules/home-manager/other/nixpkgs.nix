{
  nixpkgs = {
    config = {
      permittedInsecurePackages = [
        "ventoy-qt5-1.1.12"
        "qtwebengine-5.15.19"
      ];
      allowUnfree = true;
      allowBroken = true;
    };
  };
}
