{
  services = {
    printing.enable = true;
    avahi = {
      enable = true;
      nssmdns = true;
      publish = {
        enable = true;
        addresses = true;
      };
    };
  };
}
