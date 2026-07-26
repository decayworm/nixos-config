{ config, pkgs, ... }:

{
  imports = [
    ./modules/packages.nix
    ./modules/fish.nix
    ./modules/starship.nix
    ./modules/git.nix
    ./modules/kitty.nix
    ./modules/niri.nix
    ./modules/noctalia.nix
    ./modules/appearance.nix
  ];

  home.username = "decayworm";
  home.homeDirectory = "/home/decayworm";

  home.stateVersion = "25.05";

  programs.home-manager.enable = true;
}
