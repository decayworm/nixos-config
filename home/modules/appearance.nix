{ pkgs, ... }:

{
  home.packages = with pkgs; [
    inter
    noto-fonts
    noto-fonts-color-emoji
    papirus-icon-theme
  ];

  fonts.fontconfig.enable = true;

  home.pointerCursor = {
    enable = true;

    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 24;

    gtk.enable = true;
    x11.enable = true;
  };

  gtk = {
    enable = true;

    font = {
      package = pkgs.inter;
      name = "Inter";
      size = 11;
    };

    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };
  };

  dconf.settings."org/gnome/desktop/interface" = {
    color-scheme = "prefer-dark";
  };
}
