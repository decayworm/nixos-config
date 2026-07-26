{ pkgs, ... }:

{
  home.packages = with pkgs; [
    btop
    fastfetch
    wget
    curl
    unzip
    zip
    tree
    ripgrep
    fd
    firefox
    eza
    bat
    fzf
    zoxide
    dust
    duf
    lazygit
    lazydocker
    jq
    xwayland-satellite
  ];
}
