{
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set -g fish_greeting ""
    '';
    
    shellAliases = {
      cat = "bat";
    };

    shellAbbrs = {
      ll = "eza -lah";
      la = "eza -a";
      lt = "eza --tree --level=2";
     
      ff = "fastfetch";
      yz = "yazi";

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
