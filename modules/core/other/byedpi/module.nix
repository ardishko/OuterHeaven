_: {
  services = {
    byedpi = {
      enable = true;
      openFirewall = true;
      address = "127.0.0.1";
      socksPort = 1081;
      commandLine = ''
        -s 1+h -d 1 -N
      '';
    };
  };
}
