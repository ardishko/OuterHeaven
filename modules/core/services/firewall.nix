{ hostname, ... }:
{
  networking =
    if (hostname == "jd" || hostname == "theseus") then
      {
        firewall = {
          enable = true;
          allowedTCPPorts = [
            22
            80
            443
            25565
          ];
          allowedUDPPorts = [
            22
            80
            443
            25565
          ];
        };
        networkmanager.enable = true;
      }
    else
      {
        firewall = {
          enable = true;
          allowedTCPPorts = [
            21
            22
            443
            8080
            3131
          ];
          allowedUDPPorts = [
            21
            22
            443
            8080
            3131
          ];
        };
        # Enable networking
        networkmanager.enable = true;
      };
}
