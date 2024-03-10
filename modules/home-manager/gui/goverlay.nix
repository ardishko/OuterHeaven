{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (pkgs.goverlay.overrideAttrs {
      # cock
      src = pkgs.fetchFromGitHub {
        owner = "benjamimgois";
        repo = "goverlay";
        rev = "0.9.1";
        sha256 = "sha256-jLnWdywS398qu6lU0RMZ1cC3KM9dH9uWizuJZa7gahE";
      };
    })
  ];
}
