{
  programs.fish = {
    enable = true;

    shellAbbrs = {
      ll = "eza -lah";
      la = "eza -a";
      lt = "eza --tree --level=2";

      gs = "git status";
      ga = "git add";
      gc = "git commit";
      gl = "git log --oneline --graph --decorate";

      rebuild = "sudo nixos-rebuild switch --flake ~/nixos-config#desktop";
      rebuild-test = "sudo nixos-rebuild test --flake ~/nixos-config#desktop";
    };
  };

  programs.eza = {
    enable = true;
    enableFishIntegration = true;
    icons = "auto";
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
  };
}
