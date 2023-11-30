{ config, inputs, outputs, username, ... }:

{
  nix = {
    buildMachines = [
      {
        hostName = "vagahbond.com";
        sshUser = "vagahbond";
        system = "x86_64-linux";
        protocol = "ssh-ng";
        maxJobs = 4;
        speedFactor = 2;
        supportedFeatures = ["nixos-test" "benchmark" "big-parallel" "kvm"];
        mandatoryFeatures = [];
      }
    ];
    distributedBuilds = true;
    extraOptions = ''
      builders-use-substitutes = true
    '';
  };
  environment = {
    sessionVariables = {
      NIX_SSHOPTS = "-p 45 -t -i /home/vaporsnake/.ssh/vagahbond.pub";
    };
    # billions must use different ssh ports
    variables = {
      NIX_SSHOPTS = "-p 45 -t -i /home/vaporsnake/.ssh/vagahbond.pub";
    };
  };
}