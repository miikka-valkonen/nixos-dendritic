{
  flake.modules.homeManager.tmux = {pkgs, ...}: {
    programs.tmux = {
      enable = true;
      plugins = with pkgs.tmuxPlugins; [
        minimal-tmux-status
        yank
        copy-toolkit
        pain-control
      ];

      extraConfig = ''
        set -g default-command "env -u __ETC_PROFILE_NIX_SOURCED $SHELL"
        set-window-option -g mode-keys vi
        set -sg escape-time 10
        set -g focus-events on
        set -g default-terminal "screen-256color"
        bind r source-file ~/.config/tmux/tmux.conf \; display-message "Config reloaded..."
        bind -T copy-mode-vi v send-keys -X begin-selection
        bind d kill-session
        bind -n M-h previous-window
        bind -n M-l next-window
      '';
    };
  };
}
