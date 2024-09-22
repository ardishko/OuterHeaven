{
  inputs,
  outputs,
  username,
  hostname,
  ...
}:
{
  imports = [
    ./core
    inputs.home-manager.nixosModules.home-manager
  ];
  home-manager = {
    extraSpecialArgs = {
      inherit
        inputs
        outputs
        username
        hostname
        ;
    };
    useGlobalPkgs = false;
    useUserPackages = true;
    users = {
      # Import your home-manager configuration
      ${username} = import ./home-manager;
    };
    backupFileExtension = "backup";
  };
}
