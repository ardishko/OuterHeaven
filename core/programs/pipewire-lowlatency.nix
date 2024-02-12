 { inputs, ... }:
{
  imports = [ inputs.nix-gaming.nixosModules.pipewireLowLatency ];
  services.pipewire.lowLatency = {
    enable = true;
  };
/*
You may need to modify these values depending on your setup.
*/
}
