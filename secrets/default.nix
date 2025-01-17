{ inputs, username, ... }:
{
  imports = [ inputs.sops-nix.nixosModules.sops ];
  sops = {
    defaultSopsFile = ./secrets.yaml;
    defaultSopsFormat = "yaml";

    age.keyFile = "/home/${username}/.config/sops/age/keys.txt";

    # Begin transmission of secrets

    secrets = {
      user-pass-dir = { };
      root-pass-dir = { };
      cf = {
        # owner = "cloudflared";
      };
    };
    # templates = {
    #   cloudflare = {
    #     content = ''
    #       ${config.sops.secrets.cloudflare.path}
    #     '';
    #   };
    # };
  };
}
