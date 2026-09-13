{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;

    font = {
      name = "JetBrainsMono Nerd Font";
      package = pkgs.nerd-fonts.jetbrains-mono;
      size = 12;
    };

    shellIntegration = {
      enableFishIntegration = true;
    };
    
    extraConfig = ''
      include themes/noctalia.conf
    '';

    settings = {
      # История терминала
      scrollback_lines = 10000;

      # Окно
      window_padding_width = 10;
      confirm_os_window_close = 0;
      remember_window_size = true;
      initial_window_width = 1100;
      initial_window_height = 700;

      # Внешний вид
      background_opacity = 0.90;
      dynamic_background_opacity = true;

      # Курсор
      cursor_shape = "beam";
      cursor_blink_interval = 0;

      # Убираем звук
      enable_audio_bell = false;

      # Вкладки
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";
      tab_title_template = "{title}";

      hide_window_decorations = true;
    };

    keybindings = {
      "ctrl+shift+enter" = "new_window_with_cwd";
      "ctrl+shift+t" = "new_tab_with_cwd";

      "ctrl+shift+up" = "change_font_size all +1.0";
      "ctrl+shift+down" = "change_font_size all -1.0";
      "ctrl+shift+backspace" = "change_font_size all 0";
    };
  };
}
