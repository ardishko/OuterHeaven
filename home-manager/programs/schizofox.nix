{ inputs, pkgs, config, options, ... }:
{
  imports = [ inputs.schizofox.homeManagerModules.default ];
  programs.schizofox = {
    enable = true;
    theme = {
      background-darker = "303446";
      background = "232634";
      foreground = "C6D0F5";
      font = "Iosevka Nerd Font";
      darkreader.enable = true;
    };
    search = {
      defaultSearchEngine = "Brave";
      removeEngines = ["Google" "Bing" "Amazon.com" "eBay" "Twitter" "Wikipedia"];
      addEngines = [
        {
          Name = "Brave";
          Description = "Brave Search";
          Alias = "!br";
          Method = "GET";
          URLTemplate = "https://search.brave.com/search?q={searchTerms}";
        }
      ];
    };
    security = {
      sanitizeOnShutdown = false;
      sandbox = true;
      userAgent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:106.0) Gecko/20100101 Firefox/106.0";
    };
    misc = {
      drmFix = true;
      disableWebgl = false;
    };
  };
}