{
  flake.modules.homeManager.gtk = {
    gtk.enable = true;

    dconf.settings = {
      "org/gnome/desktop/wm/preferences" = {
        button-layout = ":minimize,maximize,close";
      };
    };
  };
}
