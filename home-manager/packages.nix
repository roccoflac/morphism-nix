{ pkgs, ... }:

# // Terminal and Shell \\ #
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
    '';
    shellAliases = {
      nix-switch = "sudo nixos-rebuild switch --flake /etc/nixos#nixos";
      nix-update = "sudo nix flake update --flake /etc/nixos && sudo nixos-rebuild switch --flake /etc/nixos#nixos";
      nix-clean = "sudo nix-collect-garbage -d";
    };
  };

  programs.micro = {
    enable = true;
    settings.colorscheme = "simple";
  };

# // --- Development --- \\ #
  programs.git = {
    enable = true;
    settings.user = {
      name = "Rocco";
      email = "roccomp4@protonmail.com";
    };
    extraConfig = {
      credential.helper = "store";
    };
  };
  
  programs.zed-editor = {
    enable = true;
    extensions = [
      "qml"
      "nim"
    ];
  };

  # // --- Desktop --- \\ #
  programs.quickshell = {
    enable = true;
    systemd.enable = true;
  };
  
  programs.sonora.enable = true;
  programs.swayimg.enable = true;

  home.packages = with pkgs; [
  
	# CLI
    tree
    psmisc
    fastfetch
    
    # Desktop
	#ladybird
    vesktop
    awww
	matugen
	wofi
	
	# Media
    mpv
    ffmpeg
    yt-dlp

	# Security
	bitwarden-desktop
	
    # Audio
    chow-tape-model
    reaper
    reaper-sws-extension
    reaper-reapack-extension
  ];
}
