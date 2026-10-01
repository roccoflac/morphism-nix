{ sonora, ... }:

{
  home.username = "rocco";
  home.homeDirectory = "/home/rocco";
  home.stateVersion = "26.05";

  imports = [
    ./packages.nix
    ./theme.nix
    sonora.homeManagerModules.default
  ];

  programs.home-manager.enable = true;
}
