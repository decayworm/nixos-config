{ ... }:

{
  xdg.configFile."fastfetch/config.jsonc" = {
    force = true;

    text = ''
      {
        "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",

        "logo": {
          "type": "builtin",
          "source": "nixos_small",
          "padding": {
            "right": 3
          }
        },

        "display": {
          "separator": "  ",
          "color": {
            "keys": "cyan",
            "title": "magenta"
          },
          "key": {
            "width": 14
          }
        },

        "modules": [
          "title",
          "separator",

          {
            "type": "os",
            "key": "󱄅 OS"
          },
          {
            "type": "kernel",
            "key": "󰒋 Kernel"
          },
          {
            "type": "wm",
            "key": "󱂬 WM"
          },
          {
            "type": "shell",
            "key": "󰆍 Shell"
          },
          {
            "type": "terminal",
            "key": "󰆍 Terminal"
          },

          "break",

          {
            "type": "cpu",
            "key": "󰻠 CPU"
          },
          {
            "type": "gpu",
            "key": "󰢮 GPU"
          },
          {
            "type": "memory",
            "key": "󰍛 Memory"
          },
          {
            "type": "disk",
            "key": "󰋊 Disk"
          },

          "break",

          {
            "type": "uptime",
            "key": "󰔛 Uptime"
          },
          {
            "type": "packages",
            "key": "󰏖 Packages"
          },

          "break",
          "colors"
        ]
      }
    '';
  };
}
