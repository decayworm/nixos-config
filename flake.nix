{
  description = "decayworm's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    zapret-discord-youtube = {
      url = "github:kartavkun/zapret-discord-youtube";
      inputs.nixpkgs.follows = "nixpkgs";
    };
 
    noctalia = {
      url = "github:noctalia-dev/noctalia";
    };

    mango = {
      url = "github:mangowm/mango";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, noctalia, mango, zapret-discord-youtube, ... }:
  {
    nixosConfigurations.desktop =
      nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./hosts/desktop/hardware-configuration.nix
          ./hosts/desktop/configuration.nix
          ./hosts/desktop/gaming.nix
          ./hosts/desktop/nvidia.nix
          ./hosts/desktop/networking.nix

          mango.nixosModules.mango

          {
            programs.mango.enable = true;
          }

          zapret-discord-youtube.nixosModules.withTestTools

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.decayworm = {
              imports = [
                noctalia.homeModules.default
                mango.hmModules.mango
                ./home/decayworm.nix
              ];
            };
          }
        ];
      };
  };
}
