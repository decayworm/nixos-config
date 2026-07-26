{
  description = "decayworm's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia";
    };
  };

  outputs = { self, nixpkgs, home-manager, noctalia, ... }:
  {
    nixosConfigurations.desktop =
      nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./hosts/desktop/hardware-configuration.nix
          ./hosts/desktop/configuration.nix
          ./hosts/desktop/gaming.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.decayworm = {
              imports = [
                noctalia.homeModules.default
                ./home/decayworm.nix
              ];
            };
          }
        ];
      };
  };
}
