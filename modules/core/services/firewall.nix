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
            8080
            2022
            8211
          ];
          allowedUDPPorts = [
            22
            80
            443
            25565
            8080
            8211
            27015
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
