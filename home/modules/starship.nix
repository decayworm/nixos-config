{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;

    settings = {
      add_newline = false;

      format = ''
        [ ](bold blue)$directory$git_branch$git_status$nix_shell$cmd_duration
        $character
      '';

      directory = {
        style = "bold cyan";
        truncation_length = 3;
        truncate_to_repo = false;
        read_only = " 🔒";
      };

      git_branch = {
        symbol = "🐧 ";
        style = "bold purple";
        format = "on [$symbol$branch]($style) ";
      };

      git_status = {
        style = "bold red";
        format = "[$all_status$ahead_behind]($style) ";
      };

      nix_shell = {
        symbol = " ";
        style = "bold blue";
        format = "via [$symbol$name]($style) ";
      };

      cmd_duration = {
        min_time = 2000;
        style = "bold yellow";
        format = "took [$duration]($style) ";
      };

      character = {
        success_symbol = "[❯](bold green)";
        error_symbol = "[❯](bold red)";
      };
    };
  };
}
