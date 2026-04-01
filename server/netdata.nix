{
  services.netdata = {
    enable = true;
    enableAnalyticsReporting = false;
    config = {
      global = {
        "web files owner" = "netdata";
      };
    };
  };
}
