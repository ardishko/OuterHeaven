{ hostname, inputs, ... }:
{
  imports = if (hostname == "jd") then [ inputs.home-manager.nixosModules.home-manager ] else [ ];
  programs.nushell = {
    enable = true;
    configFile.text = "
          $env.config = {
          show_banner: false,
          }
      ";

    envFile.text = ''
      $env.FOO = 'BAR'
    '';
  };
  # Here we enable oh-my-posh. It doesn't have its own file for organization reasons.
  programs.oh-my-posh = {
    enable = true;
    useTheme = "catppuccin_frappe";
  };
}
