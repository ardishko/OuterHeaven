{ inputs, username, ... }:
{
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];
  sops = {
    defaultSopsFile = ./secrets.yaml;
    defaultSopsFormat = "yaml";

    age.keyFile = "/home/${username}/S.O.P.S/keys.txt";

    # Begin transmission of secrets

    # secrets = {
    #   user-pass = { };
    # };
  };
}
