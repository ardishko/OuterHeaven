{ inputs, ... }:
{
  imports = [ inputs.chaotic.nixosModules.default ];
  chaotic = {
    nyx = {
      cache.enable = true;
      overlay.enable = false;
    };
  };
}
