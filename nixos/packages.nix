{ pkgs, ... }:

{
  services.flatpak.enable = true;


  programs.helium = {
    enable = true;

    flags = [
      "--enable-features=TouchpadOverscrollHistoryNavigation"
    ];

    policies = {
      "BrowserSignin" = 0;
      "PasswordManagerEnabled" = false;
      "SyncDisabled" = true;
      "ManagedBookmarks" = [
        {
          toplevel_name = "Dev Bookmarks";
        }
        {
          name = "NixOS Search";
          url = "search.nixos.org";
        }
        {
          name = "Home Manager Options";
          url = "https://home-manager-options.extranix.com/?query=&release=release-26.05":
        }
      ];
    };
  };

  programs.fish.enable = true;
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
    ripgrep

    # Security
    proton-vpn-cli

    # Audio
    pipewire.jack
  ];
}
