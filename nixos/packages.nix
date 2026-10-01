{ pkgs, ... }:

{
  services.flatpak.enable = true;

  programs.firefox = {
    enable = true;
    policies = {
      DisableTelemetry = true;
    };
  };
  programs.fish.enable = true;
  programs.foot.enable = true;
  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "foot";
  };

  fonts = {
    fontDir.enable = true;
      
    packages = with pkgs; [
      lexend
      figtree
      nerd-fonts.jetbrains-mono
      nerd-fonts.symbols-only 
    ];
  };

  environment.systemPackages = with pkgs; [
    nautilus
    cliphist
    wl-clipboard
    
    # Security
    proton-vpn-cli
  ];
}
