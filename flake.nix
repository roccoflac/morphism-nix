{
  description = "sick ass nixos config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak";
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";
    sonora.url = "github:sonorahq/sonora";

    serein = {
      url = "github:ViceVerse-cz/Serein";
    };

    helium = {
      url = "github:oxcl/nix-flake-helium-browser";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    nix-flatpak,
    nix-cachyos-kernel,
    sonora,
    serein,
    helium,
    ...
  }:
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          {
            nixpkgs.overlays = [
              nix-cachyos-kernel.overlays.pinned
            ];

            home-manager.extraSpecialArgs = {
              inherit sonora serein;
            };
          }

          ./nixos/configuration.nix
          nix-flatpak.nixosModules.nix-flatpak
          home-manager.nixosModules.default
          helium.nixosModules.default
        ];
      };
    };
}
