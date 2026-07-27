{ pkgs, ... }:

{
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    # Необходимо для работы NVIDIA в Wayland.
    modesetting.enable = true;

    # Открытый модуль ядра от NVIDIA.
    # RTX 3060 его поддерживает.
    open = true;

    # Добавляет графическое приложение NVIDIA Settings.
    nvidiaSettings = true;
  };

  # Диагностические программы.
  environment.systemPackages = with pkgs; [
    pciutils
    vulkan-tools
    mesa-demos
  ];
}
