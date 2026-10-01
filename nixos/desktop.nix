{ ... }:

{
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  xdg.terminal-exec = {
    enable = true;
    settings.default = [ "foot.desktop" ];
  };

  security.rtkit.enable = true;
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;

    extraConfig.pipewire."99-pipewire-settings" = {
      "context.properties" = {
        "default.clock.rate" = 48000;
        "default.clock.quantum" = 1024;
        "default.clock.min-quantum" = 64;
        "default.clock.max-quantum" = 2048;
      };
    };
  };
}
