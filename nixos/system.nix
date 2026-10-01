{ pkgs, ... }:

{
  boot.loader.systemd-boot.enable = false;
  boot.loader.limine = {
    enable = true;
    efiSupport = true;
    efiInstallAsRemovable = true;
  };
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages =
    pkgs.cachyosKernels.linuxPackages-cachyos-latest;

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
    substituters = [
      "https://cache.nixos.org"
      "https://attic.xuyh0120.win/lantian"
    ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
    ];
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  systemd.services.NetworkManager-wait-online.enable = false;

  services.fstrim.enable = true;
  services.upower.enable = true;

  boot.kernel.sysctl = {
    "vm.max_map_count" = 1048576;
    "fs.inotify.max_user_watches" = 524288;
    "vm.swappiness" = 10;
    "fs.file-max" = 524288;
    "net.core.netdev_max_backlog" = 5000;
    "fs.inotify.max_user_instances" = 1024;
    "net.core.default_qdisc" = "fq";
    "net.ipv4.tcp_congestion_control" = "bbr";
    "vm.dirty_background_ratio" = 5;
    "vm.dirty_ratio" = 10;
  };

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/London";
  i18n.defaultLocale = "en_GB.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MESSAGES = "en_US.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  security.pam.loginLimits = [
    { domain = "@audio"; item = "rtprio"; type = "-"; value = "95"; }
    { domain = "@audio"; item = "memlock"; type = "-"; value = "unlimited"; }
    { domain = "@audio"; item = "nice"; type = "-"; value = "-11"; }
  ];
}
