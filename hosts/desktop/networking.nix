{ config, pkgs, ... }:

{
  # GUI-клиент AmneziaVPN, Mullvad и их системная служба.
  programs.amnezia-vpn.enable = true;
  services.mullvad-vpn.enable = true;

  # Обход DPI-блокировок для Discord и других ресурсов.
  services.zapret-discord-youtube = {
    enable = false;

    # Начальная готовая стратегия.
    configName = "general(ALT6)";

    # Не обрабатывать диапазон игровых портов.
    gameFilter = "null";
  };
}
