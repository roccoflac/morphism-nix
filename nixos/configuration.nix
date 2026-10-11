{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./system.nix
    ./desktop.nix
    ./packages.nix
    ./users.nix
  ];

  nixpkgs.config.allowUnfree = true;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    # backupFileExtension = "backup";

    users.rocco = {
      imports = [
        ../home-manager/home.nix
      ];
    };
  };

  system.stateVersion = "26.05";
}
