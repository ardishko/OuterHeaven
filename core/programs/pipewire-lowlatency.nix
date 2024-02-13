 { inputs, ... }:
{
  imports = [ inputs.nix-gaming.nixosModules.pipewireLowLatency ];
  services.pipewire.lowLatency = {
    enable = true;
    quantum = 80;
    rate = 50000;
  };
/*
You may need to modify these values depending on your setup.
*/
}
