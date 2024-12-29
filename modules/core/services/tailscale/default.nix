{ pkgs, ... }:
{
  # services.tailscale = {
  #   enable = true;
  # }
  # Fix for Tailscale + Mullvad, allows all Tailscale-related traffic
  # to bypass VPN tunnel. See here for details:
  # https://mullvad.net/en/help/split-tunneling-with-linux-advanced
  # https://github.com/r3nor/mullvad-tailscale/blob/main/mullvad.rules
  # networking.nftables.tables.mullvad-tailscale = {
  #   family = "inet";
  #   content = ''
  #     chain excludeOutgoing {
  #       type route hook output priority 0; policy accept;
  #       ip  daddr 100.69.0.0/16       ct mark set 0x00000f41 meta mark set 0x6d6f6c65;
  #       ip6 daddr fd7a:115c:a1e0::/48 ct mark set 0x00000f41 meta mark set 0x6d6f6c65;
  #     }
  #
  #     chain excludeDns {
  #       type filter hook output priority -10; policy accept;
  #       ip daddr 100.100.100.100 udp dport 53 ct mark set 0x00000f41 meta mark set 0x6d6f6c65;
  #     }
  #
  #     chain allowIncoming {
  #       type filter hook input priority -100; policy accept;
  #       iifname "tailscale0" ct mark set 0x00000f41 meta mark set 0x6d6f6c65;
  #     }
  #   '';
  # };

  # Exclude Tailscale from Mullvad tunnel
  # systemd.services.mullvad-excluded-tailscale = {
  #   wantedBy = ["multi-user.target"];
  #   after = ["mullvad-daemon.service"];
  #   script = "${pkgs.mullvad}/bin/mullvad-exclude ${pkgs.tailscale}/bin/tailscaled";
  # };
}
