{ pkgs, ... }:

{
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };
  
  gtk = {
    enable = true;

    theme = {
      name = "Everforest-Dark";
      package = pkgs.everforest-gtk-theme;
    };

    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };

    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };

  xdg.configFile = {
    "gtk-4.0/gtk.css".source =
      "${pkgs.everforest-gtk-theme}/share/themes/Everforest-Dark/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source =
      "${pkgs.everforest-gtk-theme}/share/themes/Everforest-Dark/gtk-4.0/gtk-dark.css";
    "gtk-4.0/assets".source =
      "${pkgs.everforest-gtk-theme}/share/themes/Everforest-Dark/gtk-4.0/assets";
  };

  home.pointerCursor = {
    enable = true;
    gtk.enable = true;
    x11.enable = true;
    name = "Bibata-Modern-Ice";
    package = pkgs.bibata-cursors;
    size = 16;
  };
}
