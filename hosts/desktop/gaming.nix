{ pkgs, ... }:

{
  programs.steam = {
    enable = true;

    # Дополнительная версия Proton для проблемных игр
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];

    # Утилита для настройки Proton-префиксов отдельных игр
    protontricks.enable = true;
  };

  # Временные оптимизации системы во время игры
  programs.gamemode.enable = true;

  # Игровой микрокомпозитор: масштабирование, ограничение FPS,
  # принудительный полноэкранный режим и другие функции
  programs.gamescope = {
    enable = true;
    capSysNice = true;
  };

  # Показывает FPS, загрузку GPU/CPU, температуры и frametime
  environment.systemPackages = with pkgs; [
    mangohud
    lutris
    heroic
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}
