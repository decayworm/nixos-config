{ config, pkgs, ... }:

{
  home.username = "decayworm";
  home.homeDirectory = "/home/decayworm";

  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "decayworm";
    userEmail = "bogdan13049@gmail.com";
  };
}
