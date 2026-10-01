{
  description = "Rocco's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak";
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";
    sonora.url = "github:sonorahq/sonora";
  };

  outputs = { nixpkgs, home-manager, nix-flatpak, nix-cachyos-kernel, sonora, ... }:
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          # CachyOS recommends the pinned overlay so its prebuilt kernels
          # match the nixpkgs revision they were built against.
          {
            nixpkgs.overlays = [ nix-cachyos-kernel.overlays.pinned ];
            home-manager.extraSpecialArgs = { inherit sonora; };
          }

          ./nixos/configuration.nix
          nix-flatpak.nixosModules.nix-flatpak
          home-manager.nixosModules.default
        ];
      };
    };
}
