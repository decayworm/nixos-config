{
  programs.noctalia = {
    enable = true;

    settings = {
      wallpaper = {
        enabled = true;
        fill_mode = "crop";
        directory = "/home/decayworm/Pictures/Wallpapers";

        default.path =
          "/home/decayworm/Pictures/Wallpapers/wallhaven-7p89go.jpg";
      };

      backdrop = {
        enabled = false;
      };
    };
  };
}
