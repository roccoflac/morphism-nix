{ pkgs, serein, ... }:

{
  # // Terminal and Shell \\ #
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
    '';
    shellAliases = {
      nix-switch = "sudo nixos-rebuild switch --flake /etc/nixos#nixos";
      nix-update = "sudo nix flake update --flake /etc/nixos && sudo nixos-rebuild switch --flake /etc/nixos#nixos";
      nix-clean = "sudo nix-collect-garbage -d";
    };

    functions = {
      fish_prompt = {
        body = ''
          set_color blue
          echo -n (whoami)
          set_color white
          echo -n '@'
          set_color red
          echo -n $hostname
          echo -n ' '
          set_color green
          echo -n (prompt_pwd)
          echo -n ' '
          set_color white
          echo -n '$ '
          set_color normal
        '';
      };
    };
  };

  programs.foot = {
    enable = true;

    settings = {
      main = {
        include = "/home/rocco/.config/foot/foot-colors-dark.ini";
        shell = "fish";
        font = "monospace:size=14";
        pad = "10x10";
      };

      url = {
        launch = "xdg-open \${url}";
      };

      cursor = {
        style = "beam";
        blink = "no";
        "beam-thickness" = 2;
      };
    };
  };

  programs.micro = {
    enable = true;
    settings.colorscheme = "simple";
  };

  # // --- Development --- \\ #
  programs.git = {
    enable = true;
    settings.user = {
      name = "Rocco";
      email = "roccomp4@protonmail.com";
    };
    settings = {
      credential.helper = "store";
    };
  };

  programs.zed-editor = {
    enable = true;

    mutableUserSettings = true;

    extensions = [
      "rust"
      "slint"
      "nim"
      "nix"
      "qml"
    ];

    userSettings = {
      theme = {
        mode = "dark";
        light = "One Light";
        dark = "Ayu Dark";
      };
      icon_theme = "Zed (Default)";
      base_keymap = "VSCode";

      ui_font_family = "Figtree";
      ui_font_size = 17.0;

      buffer_font_family = "Figtree";
      buffer_font_size = 18.0;
      buffer_font_weight = 400.0;
      buffer_line_height = "comfortable";
      buffer_font_fallbacks = [
        "Droid Sans Mono"
        "monospace"
      ];

      project_panel = {
        bold_folder_labels = false;
        folder_indicator = "icon";
        entry_spacing = "comfortable";
        default_width = 250.0;
        dock = "left";
      };

      minimap = {
        show = "never";
      };

      status_bar = {
        "experimental.show" = false;
      };

      terminal = {
        font_family = "monospace";
      };

      cursor_shape = "bar";
      cursor_blink = false;
      cursor_animation = {
        enabled = true;
      };
      hide_mouse = "on_typing";
      reduce_motion = "off";
      unnecessary_code_fade = 0.3;

      telemetry = {
        diagnostics = false;
        metrics = false;
        anthropic_retention = false;
      };

      file_types = {
        qml = [ "*.qml" ];
      };

      load_direnv = "shell_hook";

      languages = {
        Nix = {
          language_servers = [ "nixd" ];
          formatter = {
            external = {
              command = "nixfmt";
            };
          };
        };
        Rust = {
          language_servers = [ "rust-analyzer" ];
        };
        Nim = {
          language_servers = [ "nimlsp" ];
        };
      };

      lsp = {
        nixd = {
          binary = { path = "nixd"; };
        };
      };
    };
  };

  # // --- Desktop --- \\ #
  programs.quickshell = {
    enable = true;
    systemd.enable = true;
  };

  programs.sonora.enable = true;
  programs.swayimg.enable = true;

  home.packages = with pkgs; [

	# CLI
    tree
    psmisc
    fastfetch

    # Desktop
    libnotify
    # serein.packages.${pkgs.system}.serein
    awww
	matugen
	wofi
	vesktop

	(pkgs.python3.withPackages (ps: with ps; [
	  materialyoucolor
	  pillow
	]))

	# Media
    mpv
    ffmpeg
    yt-dlp

    # Audio
    pavucontrol
    chow-tape-model
    reaper
    # reaper-sws-extension
    # reaper-reapack-extension
  ];
}
