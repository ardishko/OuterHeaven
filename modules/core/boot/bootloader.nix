{ pkgs, config, boot, ... }:
{
  boot = {
    loader = {
      # grub = {
      #   enable = true;
      #   efiSupport = true;
      #   useOSProber = true;
      #   devices = [ "nodev" ];
      # };
      # grub = {
      #   enable = true;
      #   devices = [ "nodev" ];
      #   efiSupport = true;
      #   useOSProber = true;
        # theme = {
        #   pkgs.fetchFromGitHub = {
        #     owner = "catppuccin";
        #     repo = "grub";
        #     rev = "803c5df0e83aba61668777bb96d90ab8f6847106";
        #     sha256 = "/bSolCta8GCZ4lP0u5NVqYQ9Y3ZooYCNdTwORNvR7M0=";
        #   }
        #   + "/src/catppuccin-frappe-grub-theme";
        # };
      # };
        systemd-boot.enable = true;
        efi = {
          canTouchEfiVariables = true;
        };
    };
  };
}
