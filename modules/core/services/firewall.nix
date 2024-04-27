{
  networking = {
    firewall = {
      enable = true;
      allowedTCPPorts = [21 22 443 8080 3131];
      allowedUDPPorts = [21 22 443 8080 3131];
    };
    # Enable networking
    networkmanager.enable = true;
  };
}
