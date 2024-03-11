{
  networking = {
    firewall = {
      enable = true;
      allowedTCPPorts = [21 22 443 8080];
      allowedUDPPorts = [21 22 443 8080];
    };
    # Enable networking
    networkmanager.enable = true;
  };
}
