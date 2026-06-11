{
  flake.modules.homeManager.tmux = {pkgs, ...}: {
    programs.tmux = {
      enable = true;
      plugins = with pkgs.tmuxPlugins; [
        yank
        minimal-tmux-status
      ];

      extraConfig = ''
        set-option -g default-command "env -u __ETC_PROFILE_NIX_SOURCED $SHELL"
        set-window-option -g mode-keys vi
        set-option -sg escape-time 10
        set-option -g focus-events on
        set-option -g default-terminal "screen-256color"
      '';
    };
  };
}
